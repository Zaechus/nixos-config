{
  services.auto-cpufreq.enable = true;

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
    lidSwitchDocked = "ignore";
  };
}
