{
  services.auto-cpufreq.enable = true;

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
