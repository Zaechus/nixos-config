{
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true; # battery level feature
  };

  # fix bluetooth xinput controllers
  boot.extraModprobeConfig = ''
    options bluetooth disable_ertm=1
  '';
}
