{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-pinned.url = "github:nixos/nixpkgs/2795c506fe8fb7b03c36ccb51f75b6df0ab2553f";
  };

  outputs = { self, nixpkgs, nixpkgs-pinned, ... }: {
    # # RIP nixpkgs-fmt. gonna wait for NixOS to get their stuff together before touching a different formatter
    # formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

    overlays = {
      my = import ./pkgs;
      pinned = final: prev: {
        pinned = import nixpkgs-pinned { system = "x86_64-linux"; };
      };
    };

    nixosConfigurations = let overlays = { nixpkgs.overlays = with self.overlays; [ my pinned ]; }; in {
      antimond = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/antimond/configuration.nix
          overlays
        ];
      };

      cybros = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/cybros/configuration.nix
          overlays
        ];
      };

      gantrithor = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/gantrithor/configuration.nix
          overlays
        ];
      };

      telperion = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/telperion/configuration.nix
          overlays
        ];
      };
    };

    devShells."x86_64-linux" =
      let
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
      in
      {
        cpp =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              clang-tools
              lldb
            ];
          };
        c-sharp =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              dotnet-sdk
              omnisharp-roslyn
              # netcoredbg
            ];
          };
        go =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              # delve
              go
              gopls
            ];
          };
        java =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              jdk_headless
              jdt-language-server
            ];
          };
        python =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              python3
              ruff
              ty
              # uv
            ];
          };
        rust =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              cargo
              clippy
              # lldb
              rust-analyzer
              rustc
              rustfmt
            ];
          };
        sh =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              bash-language-server
              shellcheck
              shfmt
            ];
          };
        web =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              nodePackages.typescript-language-server
              vscode-langservers-extracted # HTML, CSS
            ];
          };
      };
  };
}
