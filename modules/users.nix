{ username, ... }: { ... }:

{
  imports = [
    (import ./alacritty { inherit username; })
    (import ./bottom { inherit username; })
    (import ./helix { inherit username; })
  ];
}
