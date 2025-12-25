{ username, ... }: { config, lib, pkgs, ... }:

{
  users.users.${username} = {
    packages = with pkgs; [ zellij ];

    programs.zellij.settings = {
      default_layout = "layout";
      default_shell = lib.mkDefault "nu";
      pane_frames = false;
      scrollback_editor = lib.mkDefault "hx";
      session_serialization = false;
      simplified_ui = true;

      keybinds = builtins.readFile ./keybinds.kdl;
    };

    files.".config/zellij/layouts/layout.kdl".source = ./layout.kdl;
    files.".config/zellij/layouts/layout.swap.kdl".source = ./layout.swap.kdl;

    # TODO
    files.".config/zellij/config.kdl".text = with config.users.users.${username}.programs.zellij.settings; ''
      show_startup_tips false
      default_layout "${default_layout}"
      default_shell "${default_shell}"
      pane_frames ${if pane_frames then "true" else "false"}
      scrollback_editor "${scrollback_editor}"
      session_serialization ${if session_serialization then "true" else "false"}
      simplified_ui ${if simplified_ui then "true" else "false"}

      keybinds {
      	${builtins.replaceStrings ["\n"] ["\n\t"] (lib.removeSuffix "\n" keybinds)}
      }
    '' +
    (if builtins.hasAttr "theme" config.users.users.${username}.programs.zellij.settings then "\ntheme \"${theme}\"\n\n" else "") +
    builtins.readFile ./themes.kdl;
  };
}
