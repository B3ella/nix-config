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
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "ci.service";
    };
  };
  
  systemd.services."ci" = {
    script = ''
      cd /etc/nixos
      ${pkgs.git}/bin/git pull
      /run/current-system/sw/bin/nixos-generate-config
      /run/current-system/sw/bin/nixos-rebuild switch
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
  environment.systemPackages = [ pkgs.git ];
}
