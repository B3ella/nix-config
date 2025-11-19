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
    docker
    psmisc
    docker-buildx
    maven
    unixtools.arp
  ];
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      data-root = "var/lib/docker";
      live-restore = true;
    };
  };
}
