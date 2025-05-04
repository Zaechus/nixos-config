{ username, ... }: { ... }:

{
  imports = [
    (import ../alacritty { inherit username; })
    (import ../gammastep { inherit username; })
    (import ../sway { inherit username; })
  ];

  users.users.${username}.files.".config/mpv/mpv.conf".text = ''
    screenshot-format=png
  '';
}
