{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  systemd.network = {
    enable = true;
    wait-online.ignoredInterfaces = [ "wg0" ];
    netdevs.wg0 = {
      netdevConfig = {
        Kind = "wireguard";
        Name = "wg0";
        MTUBytes = "1420";
      };
      wireguardConfig = {
        PrivateKeyFile = "/etc/systemd/network/wg0.key"; # must be in /etc/systemd/network with 0640 root:systemd-network
        ListenPort = 51820;
        FirewallMark = 51820;
      };
      wireguardPeers = [{
        Endpoint = "146.70.174.242:51820";
        PublicKey = "l7w86I7WktXeH5okV0/c/NW14hfDiAqrkZ33MBJAmyE=";
        AllowedIPs = [ "0.0.0.0/0" ];
        # PersistentKeepalive = 25;
      }];
    };
    networks.wg0 = {
      name = "wg0";
      address = [ "10.2.0.2/32" ];
      dns = [ "10.2.0.1" ];
      domains = [ "~." ];
      networkConfig = {
        DNSDefaultRoute = true;
        DNSOverTLS = false;
      };
      routes = [{
        Destination = "0.0.0.0/0";
        Gateway = "10.2.0.1";
        GatewayOnLink = true;
        Table = 51820;
      }];
      routingPolicyRules = [
        {
          Family = "ipv4";
          InvertRule = true;
          FirewallMark = 51820;
          Table = 51820;
        }
        {
          Family = "ipv4";
          SuppressPrefixLength = 0;
          Table = "main";
        }
      ];
      linkConfig = {
        ActivationPolicy = "down"; # disable wg0 by default
      };
    };
  };

  boot.kernel.sysctl = {
    "net.ipv4.conf.all.src_valid_mark" = 1;
  };

  networking.firewall = {
    checkReversePath = "loose";
    # logReversePathDrops = true;
  };
}
