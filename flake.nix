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
    };

    homeConfigurations = {
      "lizzie@sparkle3" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./hosts/sparkle3/lizzie/home.nix
        ];
      };
    };
  };
}
