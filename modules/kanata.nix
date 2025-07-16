{ config, lib, pkgs, ... }:
{
  boot.kernelModules = [ "uinput" ];
  hardware.uinput.enable = true;
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
  users.groups.uinput = { };
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    package = pkgs.kanata-with-cmd;
    enable = true;
    keyboards = {
      internalKeyboard = {
        extraDefCfg = "process-unmapped-keys yes";
        config = ''

          (defsrc
           caps
           a s d f
           j k l
          )
          (defvar
            hold-time 200
            tap-time 200
          )
          (defalias
            escctrl (tap-hold 200 200 esc lctrl)

            a-mod (tap-hold $hold-time $tap-time a lmet)
            s-mod (tap-hold $hold-time $tap-time s lsft)
            d-mod (tap-hold $hold-time $tap-time d lctl)
            f-mod (tap-hold $hold-time $tap-time f (multi (layer-while-held navagation) lalt))

            j-mod (tap-hold $hold-time $tap-time j (multi (layer-while-held navagation) lalt))
            k-mod (tap-hold $hold-time $tap-time k lctl)
            l-mod (tap-hold $hold-time $tap-time l rsft)
          )
          (deflayer base
            @escctrl

            @a-mod @s-mod @d-mod @f-mod
            @j-mod @k-mod @l-mod
          )
          (deflayermap navagation
            caps tab a 1 s 2 d 3 f 4
            tab 5 q 6 w 7 e 8 r 9
            h left j down k up l right
            c q
          )
        '';
      };
    };
  };
}
