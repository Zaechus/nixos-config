{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    crispyDoom
    sladeUnstable
    zdbsp
  ];
}
