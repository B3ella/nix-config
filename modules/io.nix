{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    feh
    alsa-lib
    pavucontrol
    ffmpeg
    arandr
    scrot
  ];
}
