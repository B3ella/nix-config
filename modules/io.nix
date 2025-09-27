{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    feh
    pkgs.alsa-lib
    pavucontrol
    ffmpeg
    arandr
    scrot
  ];
}
