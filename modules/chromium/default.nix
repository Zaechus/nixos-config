{ pkgs, ... }:

{
  home-manager.users.zaechus.programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    extensions = [
      #"eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      #"cjpalhdlnbpafiamejdnhcphjbkeiagm" # Ublock Origin
    ];
  };
}
