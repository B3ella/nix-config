{ pkgs, ... }:
{
  services.foundationdb = {
    enable = true;
    openFirewall = true;
    package = pkgs.foundationdb;
  };
}
