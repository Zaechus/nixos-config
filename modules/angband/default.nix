{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ angband ];

  environment.shellAliases = {
    angband = "angband -mgcu -- -D";
  };

  #environment.etc."angband/customize/keys-gcu.prf".text = "";
}
