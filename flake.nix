{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-pinned.url = "github:nixos/nixpkgs/c792c60b8a97daa7efe41a6e4954497ae410e0c1";
  };

  outputs = { self, nixpkgs, nixpkgs-pinned, ... }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

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
        python =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs.python312Packages; [
              python
              pylsp-mypy
            ];
          };
        rust =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              cargo
              clippy
              rust-analyzer
              rustc
              rustfmt
            ];
          };
        sh =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
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
