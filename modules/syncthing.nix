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
    listenAddress = [
      "tcp://0.0.0.0:8080"
      "quic://0.0.0.0:8080"
      "dynamic+https://relays.syncthing.net/endpoint"
    ];
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
          id = "ISGJZIJ-5DYQEI2-S7YGJXV-5V3MJDW-DNC5BO5-ETDN6C7-PQYVBTH-T4ZBYQG";
        };
        "jesss-desktop" = {
          id = "RS7QAOS-H43IJPS-HL52MYD-VDBU4QE-Y7W5UZG-67I47OW-BRIBAYB-5J65EA2";
        };
      };
      folders = {
        "telepatia" = {
          path = "/home/bella/telepatia";
          devices = ["jesss" "Desktop" "Notebook" "jesss-desktop"];
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
