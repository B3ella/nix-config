{config, pkgs, ...}:
{
  home.username = "bella";
  home.homeDirectory = "/home/bella";
  home.packages = [
    (pkgs.writeShellScriptBin "editnix" ''
      cd /etc/nixos
      sudo nvim .
    '')
  ];
  home.file = {};
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # don't change
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
