{ pkgs, ... }:

# https://www.minecraft.net/en-us/download/server/bedrock
{
  systemd.services.bedrock-server = {
    after = [ "network.target" ];
    description = "Bedrock Dedicated Server";
    wantedBy = [ "multi-user.target" ];
    environment = { LD_LIBRARY_PATH = "/home/bedrockserver/bedrock-server"; };
    serviceConfig = {
      WorkingDirectory = "/home/bedrockserver/bedrock-server";
      ExecStart = "${pkgs.steam-run}/bin/steam-run /home/bedrockserver/bedrock-server/bedrock_server"; # lol
      User = "bedrockserver";
      Group = "bedrockserver";
    };
    unitConfig = {
      ConditionPathExists = "/home/bedrockserver/bedrock-server";
    };
  };

  users.users.bedrockserver = {
    isSystemUser = true;
    group = "bedrockserver";
    home = "/home/bedrockserver";
    createHome = true;
  };
  users.groups.bedrockserver.name = "bedrockserver";

  networking.firewall.allowedUDPPorts = [ 19132 19133 ];
}
