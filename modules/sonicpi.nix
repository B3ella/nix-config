{pkgs, ...}:
{
  environment.variables = rec {
    ELIXIR_ERL_OPTIONS="+fnu";
  };
  environment.systemPackages = [ 
    pkgs.sonic-pi
 ];
}
