{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    poetry
    rustc
    cargo
    gcc
    nodejs_24
    python314
    zulu24
    psmisc
    maven
    unixtools.arp
  ];
  #services.mysql = {
  #  enable = false;
  #  package = pkgs.mariadb;
  #};
  #virtualisation.docker = {
  #  enable = false;
  #  daemon.settings = {
  #    data-root = "var/lib/docker";
  #    live-restore = true;
  #  };
  #};
}
