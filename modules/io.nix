{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    feh
    pkgs.alsa-lib
    ffmpeg
    arandr
    scrot
  ]
}
