{ username, ... }: { pkgs, ... }:

{
  users.users.${username} = {
    files.".config/gammastep/config.ini".text = ''
      [general]
      adjustment-method=wayland
      dawn-time=05:30-06:30
      dusk-time=20:30-21:30
      location-provider=manual
      temp-day=6500
      temp-night=4500

      [manual]
    '';

    files.".local/share/systemd/user/gammastep.service".text = ''
      [Unit]
      Description=Display colour temperature adjustment
      PartOf=graphical-session.target
      After=graphical-session.target

      [Service]
      ExecStart=${pkgs.gammastep}/bin/gammastep -c /home/${username}/.config/gammastep/config.ini
      Restart=on-failure

      [Install]
      WantedBy=graphical-session.target
    '';
  };
}
