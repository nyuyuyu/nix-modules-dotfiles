{ pkgs, ... }:

{
  config.home = {
    packages = [
      pkgs.fzf
    ];

    sessionVariables = {
      FZF_DEFAULT_OPTS = "--layout=reverse --border";
    };
  };
}
