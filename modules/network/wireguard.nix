{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  # broken due to "systemd-networkd: wg0: Failed to read private key from /root/key. Ignoring network device."
  systemd.network = {
    enable = true;
    netdevs.wg0 = {
      netdevConfig = {
        Kind = "wireguard";
        Name = "wg0";
      };
      wireguardConfig = {
        PrivateKeyFile = "/root/key";
        ListenPort = 51820;
      };
      wireguardPeers = [{
        wireguardPeerConfig = {
          Endpoint = "107.181.245.74:51820";
          PublicKey = "fM5t18SNQhPw5zXr/6crLPu9KseB3/BeDF+McXoclmg=";
          AllowedIPs = [ "0.0.0.0/0" ];
        };
      }];
    };
    networks.wg0 = {
      matchConfig.Name = "wg0";
      address = [ "10.2.0.2/32" ];
      routes = [{
        routeConfig = {
          Gateway = "10.2.0.1";
          Destination = "10.2.0.0/24";
        };
      }];
    };
  };

  systemd.services.wireguard = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    bindsTo = [ "sys-subsystem-net-devices-wg0.device" "systemd-networkd.service" "systemd-resolved.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStart = "resolvectl dnsovertls wg0 no";
      ExecReload = "resolvectl dnsovertls wg0 no";
    };
    unitConfig = {
      ConditionPathExists = "/sys/class/net/wg0";
    };
  };
}
