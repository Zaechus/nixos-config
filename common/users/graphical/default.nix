{ username, ... }: { ... }:

{
  imports = [
    (import ../alacritty { inherit username; })
    (import ../gammastep { inherit username; })
    (import ../sway { inherit username; })
  ];
}
