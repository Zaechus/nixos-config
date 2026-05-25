{
  # services.power-profiles-daemon.enable = true; # what a nightmare. disable for now.

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };

  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
  };
}
