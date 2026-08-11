{ pkgs, ... }:

{
  programs.tmux = {
    plugins = [
      pkgs.tmuxPlugins.sensible
    ];
  };
}
