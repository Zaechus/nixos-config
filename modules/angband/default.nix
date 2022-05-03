{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ angband ];

  environment.shellAliases.angband = "angband -dpref=/etc/angband/customize -mgcu";

  environment.etc = let
    customize = "angband/customize";
    pkg = "${pkgs.angband}/etc/angband/customize";
  in {
    "${customize}/font-gcu.prf".source = "${pkg}/font-gcu.prf";
    "${customize}/font-sdl.prf".source = "${pkg}/font-sdl.prf";
    "${customize}/font-win.prf".source = "${pkg}/font-win.prf";
    "${customize}/font-x11.prf".source = "${pkg}/font-x11.prf";
    "${customize}/font.prf".source = "${pkg}/font.prf";
    "${customize}/keys-gcu.prf".text = ""; # remove hacky keymaps that force sprinting
    "${customize}/message.prf".source = "${pkg}/message.prf";
    "${customize}/pref.prf".source = "${pkg}/pref.prf";
    "${customize}/sound.prf".source = "${pkg}/sound.prf";
    "${customize}/user.prf".source = "${pkg}/user.prf";
  };
}
