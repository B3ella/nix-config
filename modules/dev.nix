{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    devenv
    git
    poetry
    rustc
    cargo
    clippy
    rustfmt
    cargo-nextest
    cargo-release
    gcc
    nodejs_24
    python314
    psmisc
    maven
    unixtools.arp
    cmake
  ];
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    settings.mysqld.port = 3305;
  };
  #virtualisation.docker = {
  #  enable = false;
  #  daemon.settings = {
  #    data-root = "var/lib/docker";
  #    live-restore = true;
  #  };
  #};
}
