{ nix-colors, pkgs, nvf, username, ... }:

{ 
  imports = [
    ./i3.nix
    ./alacritty.nix
    ./neovim.nix
    ./zsh.nix
    ./scripts.nix
    ./git.nix
    ./qute.nix
    ./status.nix
    nix-colors.homeManagerModules.default
  ];
  colorScheme = nix-colors.colorSchemes.kanagawa;

  programs.nvf.enableManpages = true;

  home.packages = [
    (pkgs.writeShellScriptBin "gotonix" ''
      cd /etc/nixos
    '')
    (pkgs.writeShellScriptBin "editnix" ''
      cd /etc/nixos
      nvim .
    '')
    (pkgs.writeShellScriptBin "nrs" ''
      sudo nixos-rebuild switch
    '')
    (pkgs.writeShellScriptBin "nrb" ''
      nixos-generate-config
      sudo nixos-rebuild boot
      reboot
    '')
    (pkgs.writeShellScriptBin "nsz" ''
        nix-shell . --command zsh
    '')
    (pkgs.writeShellScriptBin "nzs" ''
        nix-shell . --command zsh
    '')
  ];
  
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  #dont change
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
