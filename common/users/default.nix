{ username, ... }: { ... }:

{
  imports = [
    (import ./bottom { inherit username; })
    (import ./helix { inherit username; })
  ];
}
