{ username, ... }: { ... }:

{
  users.users.${username} = {
    programs.helix = {
      enable = true;
      settings.editor.color-modes = true;
    };

    programs.zellij.settings.scrollback_editor = "hx";
  };
}
