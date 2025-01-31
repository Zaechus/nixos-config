{ username, ... }: { ... }:

{
  users.users.${username}.files.".config/gammastep/config.ini".text = ''
    [general]
    dawn-time=05:30-06:30
    dusk-time=20:30-21:30
    location-provider=manual
    temp-day=5500
    temp-night=3700

    [manual]
  '';
}
