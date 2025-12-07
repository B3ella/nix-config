{pkgs, lib, ...}:
{

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    "initcall_blacklist=simpledrm_platform_driver_init"
  ];
  boot.loader.grub = {
    enable = false;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    splashImage = ../public/bg1.png;
    backgroundColor = "#000000";
 };
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
