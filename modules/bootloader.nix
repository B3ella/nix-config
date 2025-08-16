{pkgs, ...}:
{

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    "initcall_blacklist=simpledrm_platform_driver_init"
  ];
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    theme = "/etc/nixos/grub-themes/lain";
 };
}
