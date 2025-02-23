{config, pkgs, ...}:
{
  home.username = "bella";
  home.homeDirectory = "/home/bella";
  home.packages = [
    (pkgs.writeShellScriptBin "editnix" ''
      cd /etc/nixos
      sudo nvim .
    '')
    (pkgs.writeShellScriptBin "nrb" ''
      sudo nixos-rebuild boot
    '')
    (pkgs.writeShellScriptBin "nrs" ''
      sudo nixos-rebuild switch
    '')
  ];
  home.file = {};
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userName = "b3ella";
    userEmail = "isabellaoliveiradev@gmail.com";
  };
  # don't change
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
