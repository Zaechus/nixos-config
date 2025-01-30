{ username, ... }: { pkgs, ... }:

{
  users.users.${username} = {
    packages = with pkgs; [
      nethack
    ];

    files.".nethackrc".source = ./nethackrc;
  };
}
