{pkgs, groundhog, ...}:
let
  groundhogPkg = groundhog.packages.${pkgs.system}.default;
in {
  systemd.timers."dailynote" = {
    wantedBy = [ "timers.target" ];
     timerConfig = {
        OnCalendar = "daily";
        Persistent = true; 
    };
  };
  
  systemd.services."dailynote" = {
    script = "${groundhogPkg}/bin/groundhog";   # absolute path
    serviceConfig = {
      Type = "oneshot";
      User = "bella";
    };
  };
}
