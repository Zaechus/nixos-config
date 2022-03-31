{
  networking = {
    useNetworkd = true;

    useDHCP = false;
  };

  systemd.services."systemd-networkd-wait-online".enable = false;
}
