{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-pinned.url = "github:nixos/nixpkgs/c792c60b8a97daa7efe41a6e4954497ae410e0c1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-pinned, home-manager, ... }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

    overlays = {
      my = import ./pkgs;
      pinned = final: prev: {
        pinned = import nixpkgs-pinned { system = "x86_64-linux"; };
      };
    };

    nixosConfigurations = let overlays = { nixpkgs.overlays = [ self.overlays.my self.overlays.pinned ]; }; in {
      antimond = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/antimond/configuration.nix
          overlays
          home-manager.nixosModules.home-manager
        ];
      };

      cybros = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/cybros/configuration.nix
          overlays
          home-manager.nixosModules.home-manager
        ];
      };

      gantrithor = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/gantrithor/configuration.nix
          overlays
          home-manager.nixosModules.home-manager
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
            nativeBuildInputs = with pkgs; [
              python3
              python311Packages.pylsp-mypy
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
