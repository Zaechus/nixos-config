{ username, ... }: { pkgs, ... }:

{
  users.users.${username} = {
    packages = with pkgs; [
      (dwarf-fortress.override {
        enableIntro = false;
        enableTextMode = true;
        enableSound = false;
      })
    ];
  };
}
