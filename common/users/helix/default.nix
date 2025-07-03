{ username, ... }: { ... }:

{
  users.users.${username} = {
    programs.helix = {
      enable = true;
      settings.editor.color-modes = true;
    };

    programs.git.config = {
      merge.tool = "hx";
      mergetool.hx.cmd = ''hx "$MERGED"'';
      mergetool.keepBackup = false;
    };

    programs.zellij.settings.scrollback_editor = "hx";
  };
}
