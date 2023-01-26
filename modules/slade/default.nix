{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    crispyDoom
    slade
    zdbsp
  ];
}
