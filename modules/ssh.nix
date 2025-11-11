{ config, lib, pkgs, ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = true;
      PermitRootLogin = "no";
      AllowUsers = [ "bella" ];
    };
    openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    thc-hydra
  ];
}
