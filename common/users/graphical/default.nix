{ username, ... }: { ... }:

{
  imports = [
    (import ../alacritty { inherit username; })
    (import ../sway { inherit username; })
  ];
}
