{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ zellij ];

  programs.zellij.settings = {
    default_layout = "layout";
    default_shell = lib.mkDefault "nu";
    pane_frames = false;
    scrollback_editor = lib.mkDefault "hx";
    simplified_ui = true;

    keybinds = builtins.readFile ./keybinds.kdl;
  };

  home.file.".config/zellij/layouts/layout.kdl".source = ./layout.kdl;
  home.file.".config/zellij/layouts/layout.swap.kdl".source = ./layout.swap.kdl;

  home.file.".config/zellij/config.kdl".text = with config.programs.zellij.settings; ''
    default_layout "${default_layout}"
    default_shell "${default_shell}"
    pane_frames ${if pane_frames then "true" else "false"}
    scrollback_editor "${scrollback_editor}"
    simplified_ui ${if simplified_ui then "true" else "false"}

    keybinds {
      ${keybinds}
    }

    theme "${theme}"
  '' + builtins.readFile ./themes.kdl;
}
