{ username, ... }: { ... }:

{
  users.users.${username}.files.".config/ley/k_lite.verb".source = ./k_lite.verb;
}
