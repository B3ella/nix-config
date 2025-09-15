{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neofetch
    cmatrix
    cava
    hyfetch
    ghfetch
  ];
}
