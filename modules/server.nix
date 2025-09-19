{...}:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
    ];
  };
  services.ddns-updater = {
    enable = true;
    environment = {
      provider = "cloudflare";
      #zone_identifier: ;
      domain = "self.isabellaoliveira.dev";
      ttl = "600";
      token = "yourtoken";
      ip_version = "ipv4";
      #ipv6_suffix:
    };
  };
}
