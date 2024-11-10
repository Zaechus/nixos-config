{
  # services.auto-cpufreq.enable = true; # FIXME

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
    lidSwitchDocked = "ignore";
  };
}
