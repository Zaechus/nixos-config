{ username, ... }: { ... }:

{
  imports = [
    (import ./bottom { inherit username; })
    (import ./helix { inherit username; })
    (import ./nushell { inherit username; })
  ];

  users.users.${username} = {
    programs.bat.enable = true;
    programs.git.enable = true;
  };
}
