{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

    overlays.my = import ./pkgs;

    nixosConfigurations = {
      antimond = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          { nixpkgs.overlays = [ self.overlays.my ]; }
          ./hosts/antimond/configuration.nix
        ];
      };

      cybros = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          { nixpkgs.overlays = [ self.overlays.my ]; }
          ./hosts/cybros/configuration.nix
        ];
      };

      gantrithor = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          { nixpkgs.overlays = [ self.overlays.my ]; }
          ./hosts/gantrithor/configuration.nix
        ];
      };

      telperion = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          { nixpkgs.overlays = [ self.overlays.my ]; }
          ./hosts/telperion/configuration.nix
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
