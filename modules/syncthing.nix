{ config, lib, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    group = "root";
    user = "bella";
    dataDir = "/home/bella";    # Default folder for new synced folders
    configDir = "/home/bella/.config/syncthing";   # Folder for Syncthing's settings and keys
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "celular" = {
          id = "WU4FYL4-BOITC37-F2XJHV5-KHZ6BLV-FPKRI6H-EL2YBZJ-RNTE2TX-JWR6OA5";
        };
      };
      folders = {
        "Notes" = {
          path = "/home/bella/General";
          devices = ["celular"];
        };
        "Passwords" = {
          path = "/home/bella/Password";
          devices = ["celular"];
        };
      };
    };
  };
}
