{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    chocolateDoom
    sladeUnstable
    zdbsp
  ];
}
