{
  imports = [
    ../fonts
    ../sway/nixos.nix
  ];

  nixpkgs.config.allowUnfree = true;

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    #brightnessctl
    bat exa fd ripgrep
    neovim
    git
    bottom
    rustup gcc
  ];
}
