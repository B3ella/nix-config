{pkgs, ...}:
{
  systemd.timers."dailynote" = {
    wantedBy = [ "timers.target" ];
     timerConfig = {
        OnCalendar = "daily";
        Persistent = true; 
    };
  };
  
  systemd.services."dailynote" = {
    script = ''
      daily-note
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "bella";
      RemainAfterExit = true;
    };
  };
  systemd.timers."ci" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "1m";
      OnUnitActiveSec = "1m";
      Unit = "ci.service";
    };
  };
  
  systemd.services."ci" = {
    script = ''
      cd /etc/nixos
      ${pkgs.git}/bin/git stash
      ${pkgs.git}/bin/git pull
      ${pkgs.git}/bin/git stash pop
      /run/current-system/sw/bin/nixos-generate-config
      /run/current-system/sw/bin/nixos-rebuild switch
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      RemainAfterExit = true;
    };
  };
  environment.systemPackages = [ pkgs.git ];
}
