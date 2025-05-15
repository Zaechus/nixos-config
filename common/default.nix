{ config, pkgs, lib, ... }:

{
  imports = [
    ../modules
    ./git
  ];

  boot.consoleLogLevel = 2;
  boot.loader = {
    timeout = 1;
    systemd-boot.editor = false;
  };
  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
  };
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

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

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    bottom
    fd
    file
    ouch
    pciutils
    ripgrep
    usbutils

    my.zinfo
  ];
  environment.defaultPackages = [ pkgs.helix ];
  environment.sessionVariables.EDITOR = "hx";

  users.defaultUserShell = pkgs.nushell;
  environment.shells = [ pkgs.nushell ];

  environment.localBinInPath = true;

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

  programs.bat.enable = true;

  environment.shellAliases = {
    diff = "diff --color";
    doas = "sudo";
    ip = "ip -c";

    ls = "ls";
    l = "ls";
    la = "l -a";
    ll = "l -l";
    lal = "l -al";

    pp = "ping 1.1.1.1";
    x = "xdg-open";
  };
}
