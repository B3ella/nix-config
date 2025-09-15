{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    poetry
    rustc
    cargo
    gcc
    nodejs_24
  ];
}
