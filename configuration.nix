{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/kanata.nix
      ./modules/syncthing.nix
      ./modules/services.nix
      ./modules/i3.nix
      ./modules/bootloader.nix
      ./modules/locale.nix
      ./modules/flex.nix
      ./modules/dev.nix
      ./modules/io.nix
      ./modules/eyepatch.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.

  nix.settings.auto-optimise-store = false;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  networking.networkmanager.enable = true;

  services.libinput.touchpad = {
    disableWhileTyping = true;
  };

  environment.variables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";
  };

  services.xserver.xkb = {
    layout = "br";
    variant = "thinkpad";
  };

  console.keyMap = "br-abnt2";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.zsh.enable = true;
  users.users.bella = {
    isNormalUser = true;
    description = "Isabella Oliveira";
    extraGroups = [ "networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    tmux
    networkmanager
    networkmanagerapplet
    home-manager
    unzip
    lynx
    pkg-config
    pkgs.pkg-config
    sutils
    trash-cli
    md2pdf
    dysk
    syncthing
    keepassxc
    gh
    alacritty
    rofi
    htop
    qutebrowser
    librewolf
    kdePackages.okular
    anki
    brmodelo
    mars-mips
    unixtools.netstat
    firefox
    youtube-dl
  ];
  services.blueman.enable = true;

  system.stateVersion = "24.11";
}
