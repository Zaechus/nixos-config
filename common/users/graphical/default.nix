{ username, ... }: { ... }:

{
  imports = [
    (import ../alacritty { inherit username; })
  ];
}
