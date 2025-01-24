{ username, ... }: { ... }:

{
  imports = [
    (import ../../modules/users.nix { inherit username; })

    ./bottom
    ./helix
  ];
}
