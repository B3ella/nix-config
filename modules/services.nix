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
      git pull
      nixos-generate-config
      nixos-rebuild switch
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "bella";
      RemainAfterExit = true;
    };
  };
  environment.systemPackages = [ pkgs.git ];
}
