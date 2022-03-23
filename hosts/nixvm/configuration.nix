# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  autologin = pkgs.writeText "autologin-script.sh" ''
    if [[ "$(tty)" == "/dev/tty1" ]]; then
      ${pkgs.shadow}/bin/login -f zaechus;
    else
      ${pkgs.shadow}/bin/login;
    fi
  '';
in
{
  imports =
    [
      (import "${home-manager}/nixos")
      ../../home-manager/default.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TTY1 Autologin
  services.getty = {
    loginProgram = "${pkgs.bash}/bin/sh";
    loginOptions = toString autologin;
    extraArgs = [ "--skip-login" ];
  };

  networking.hostName = "nixvm"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Denver";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };
  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  home-manager.users.zaechus = {
    wayland.windowManager.sway = {
      enable = true;
      config = {
	keybindings = {
          "Mod4+Return" = "exec alacritty";
          "Mod4+d" = "exec bemenu-run";

          "Mod4+e" = "layout toggle split";
          "Mod4+w" = "layout tabbed";

          "Mod4+Up" = "focus up";
          "Mod4+Down" = "focus down";
          "Mod4+Left" = "focus left";
          "Mod4+Right" = "focus right";

          "Mod4+Shift+Up" = "move up";
          "Mod4+Shift+Down" = "move down";
          "Mod4+Shift+Left" = "move left";
          "Mod4+Shift+Right" = "move right";

	  "Mod4+1" = "workspace number 1";
	  "Mod4+2" = "workspace number 2";
	  "Mod4+3" = "workspace number 3";
	  "Mod4+4" = "workspace number 4";
	  "Mod4+5" = "workspace number 5";
	  "Mod4+6" = "workspace number 6";
	  "Mod4+7" = "workspace number 7";
	  "Mod4+8" = "workspace number 8";
	  "Mod4+9" = "workspace number 9";
	  "Mod4+0" = "workspace number 10";

          "Mod4+Shift+1" = "move container to workspace number 1";
          "Mod4+Shift+2" = "move container to workspace number 2";
          "Mod4+Shift+3" = "move container to workspace number 3";
          "Mod4+Shift+4" = "move container to workspace number 4";
          "Mod4+Shift+5" = "move container to workspace number 5";
          "Mod4+Shift+6" = "move container to workspace number 6";
          "Mod4+Shift+7" = "move container to workspace number 7";
          "Mod4+Shift+8" = "move container to workspace number 8";
          "Mod4+Shift+9" = "move container to workspace number 9";
          "Mod4+Shift+0" = "move container to workspace number 10";
	};

	bars = [{
	  position = "top";
	  statusCommand = "echo 1";
        }];

	startup = [
          #{ command = "pipewire" }
        ];
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #brightnessctl
    bat exa fd ripgrep
    neovim
    git
    neofetch
    bottom
    rustup gcc
    ungoogled-chromium
    lutris papirus-icon-theme
  ];
  
  nixpkgs.config.allowUnfree = true;

  # Shell
  programs.zsh = {
    enable = true;
    shellAliases = {
      doas = "sudo";
      ll = "exa -aalg";
      pp = "ping 1.1.1.1";
    };
    promptInit = ''
      PROMPT=$'\n'"%F{6}%~%f"$'\n'"%B%(#.%F{1}.%F{2})%# %f%b"
    '';
  };
  users.defaultUserShell = pkgs.zsh;

  # Sway
  hardware.opengl.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bemenu grim slurp swaylock wl-clipboard
      alacritty
    ];
  };

  #xdg.portal.wlr.enable = true;

  environment.loginShellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      WLR_RENDERER_ALLOW_SOFTWARE=1 sway
    fi
  '';

  # Fonts
  fonts.fonts = with pkgs; [
    fira-code
    noto-fonts-emoji
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  #services.pipewire.enable

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
