{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  # https://github.com/WireGuard/wireguard-tools/blob/master/src/systemd/wg-quick%40.service
  systemd.services.wg-quick = {
    description = "WireGuard via wg-quick(8) for wg0";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    bindsTo = [ "sys-subsystem-net-devices-wg0.device" "systemd-networkd.service" "systemd-resolved.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStart = "${pkgs.wireguard-tools}/bin/wg-quick up wg0";
      ExecStartPost = "resolvectl dnsovertls wg0 no";
      ExecStop = "${pkgs.wireguard-tools}/bin/wg-quick down wg0";
      ExecReload = "/usr/bin/env bash -c 'exec ${pkgs.wireguard-tools}/bin/wg syncconf wg0 <(exec ${pkgs.wireguard-tools}/bin/wg-quick strip wg0)'";
      Environment = "WG_ENDPOINT_RESOLUTION_RETRIES=infinity";
    };
    unitConfig = {
      ConditionPathExists = "/etc/wireguard/wg0.conf";
    };
  };

  # broken due to "systemd-networkd: wg0: Failed to read private key from /root/key. Ignoring network device."
  # systemd.network = {
  #   enable = true;
  #   netdevs.wg0 = {
  #     netdevConfig = {
  #       Kind = "wireguard";
  #       Name = "wg0";
  #     };
  #     wireguardConfig = {
  #       # PrivateKeyFile = "";
  #       ListenPort = 51820;
  #     };
  #     wireguardPeers = [{
  #       wireguardPeerConfig = {
  #         # Endpoint = "";
  #         # PublicKey = "";
  #         AllowedIPs = [ "0.0.0.0/0" ];
  #       };
  #     }];
  #   };
  #   networks.wg0 = {
  #     matchConfig.Name = "wg0";
  #     # address = [ "" ];
  #     routes = [{
  #       routeConfig = {
  #         # Gateway = "";
  #         # Destination = "";
  #       };
  #     }];
  #     extraConfig = ''
  #       DNSOverTLS=no;
  #     '';
  #   };
  # };
}
