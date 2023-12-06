# The base configuration
#
# The default module includes basic system utilities and configuration that
# should be present on all systems.

{ config, pkgs, lib, ... }:

{
  boot.loader.timeout = 1;
  powerManagement.cpuFreqGovernor = "schedutil";
  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
  };
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  # services.fwupd.enable = true;

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 32d";
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    fd
    ouch
    ripgrep
    my.zinfo
  ];
  environment.defaultPackages = [ pkgs.helix ];
  environment.variables = {
    EDITOR = "hx";
  };

  users.defaultUserShell = pkgs.nushell;
  environment.shells = [ pkgs.nushell ];

  security.sudo.execWheelOnly = true;

  services.getty = {
    greetingLine = "NixOS ${builtins.substring 0 5 config.system.nixos.label} (\\m) - \\l";
    helpLine = lib.mkForce "";
  };
  users.motd = "\nHello, sailor!\n\n";

  services.nscd.enableNsncd = true;

  console.keyMap = "us";
  console.font = "Lat2-Terminus16";
  console.colors = [
    "282828"
    "cc241d"
    "98971a"
    "d79921"
    "458588"
    "b16286"
    "689d6a"
    "a89984"
    "928374"
    "fb4934"
    "b8bb26"
    "fabd2f"
    "83a598"
    "d3869b"
    "8ec07c"
    "ebdbb2"
  ];

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
    lidSwitchDocked = "ignore";
  };
}
