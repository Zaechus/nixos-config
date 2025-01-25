{ username, ... }: { ... }:

{
  users.users.${username}.programs.bottom = {
    enable = true;
    settings.flags = {
      battery = true;
      regex = true;
    };
  };
}
