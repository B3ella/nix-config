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
        "Desktop" = {
          id = "QBUG4QF-7XYOLYJ-KVHWGNO-2XMWHG3-CMESV42-P5DOVCZ-XRMUL2A-ARFYHQA";
        };
      };
      folders = {
        "Notes" = {
          path = "/home/bella/Notes";
          devices = ["celular" "Desktop"];
        };
        "Passwords" = {
          path = "/home/bella/Password";
          devices = ["celular" "Desktop"];
        };
        "Photos" = {
          path = "/home/bella/Photos";
          devices = ["celular" "Desktop"];
        };
        "Books" = {
          path = "/home/bella/Media/books";
          devices = ["celular" "Desktop"];
        };
        "Documents" = {
          path = "/home/bella/Documents";
          devices = ["celular" "Desktop"];
        };
      };
    };
  };
}
