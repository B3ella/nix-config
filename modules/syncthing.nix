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
        "Notebook" = {
          id = "FIZLWUW-E3SHM5D-OYUDEW3-BQBJQC3-OHWLFYD-JCFP57Y-VAVSIKS-PYZSMQA";
        };
        "jesss" = {
          id = "4MIHKO7-Y523DDK-QBEEEKM-QOQHL6T-WZHVPGF-SODFWQK-MRQEHND-PF7FBQ4";
        };
      };
      folders = {
        "telepatia" = {
          path = "/home/bella/telepatia";
          devices = ["jesss" "Desktop" "Notebook"];
        };
        "Notes" = {
          path = "/home/bella/Notes";
          devices = ["celular" "Desktop" "Notebook"];
        };
        "Passwords" = {
          path = "/home/bella/Password";
          devices = ["celular" "Desktop" "Notebook"];
        };
        "Photos" = {
          path = "/home/bella/Photos";
          devices = ["celular" "Desktop" "Notebook"];
        };
        "Books" = {
          path = "/home/bella/Media/books";
          devices = ["celular" "Desktop" "Notebook"];
        };
        "Documents" = {
          path = "/home/bella/Documents";
          devices = ["celular" "Desktop" "Notebook"];
        };
      };
    };
  };
}
