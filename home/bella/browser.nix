{...}:

{
  programs.librewolf = {
    enable = true;
    profiles.bella = {
        
        userChrome = ''
            #TabsToolbar {
                visibility: collapse !important;
            }
            #sidebar-header, #search-box {
                display: none!important;
            }
            #sidebar-header {
                display: none !important;
            }

            #sidebar-splitter {
                background-color: black!important;
                width: 1px!important;
                border: 0px!important;
            }
        '';
    };
  };
}
