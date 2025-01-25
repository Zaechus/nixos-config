{ username, ... }: { ... }:

{
  users.users.${username}.programs.helix = {
    enable = true;
    settings.editor.color-modes = true;
  };
}
