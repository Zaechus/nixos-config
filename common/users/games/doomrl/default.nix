{ username, ... }: { pkgs, ... }:

{
  users.users.${username} = {
    files.".config/doomrl/config.lua".source = ./config.lua;
    files.".config/doomrl/keybindings.lua".source = ./keybindings.lua;
  };

  programs.steam.extraPackages = with pkgs; [
    SDL
    SDL_mixer
  ];
}
