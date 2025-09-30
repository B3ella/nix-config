{...}:
{
  boot.kernelParams = [ "mem_sleep_default=deep" ];
  # suspend-then-hibernate
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=24h
    SuspendState=mem
  '';
}
