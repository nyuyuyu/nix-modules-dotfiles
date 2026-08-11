{ ... }:

{
  home = {
    sessionVariables = {
      LANG = "ja_JP.UTF-8";
    };

    shellAliases = {
      cp = "cp -i";
      ll = "ls -lhsa --color=auto";
      ls = "ls --color=auto";
      mv = "mv -i";
      rm = "rm -i";
    };
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting ""
      set -gx SHELL (which fish)
    '';
  };
}
