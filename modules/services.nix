{...}:
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
}
