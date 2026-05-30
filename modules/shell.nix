{...}:
{
  programs.zsh = {
    enable = true;

    shellAliases = {
      n = "nvim .";
    };
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
  };
}
