{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../fzf
  ];

  programs.fish = {
    plugins = with pkgs; [
      {
        name = fishPlugins.fzf-fish.pname;
        src = fishPlugins.fzf-fish.src;
      }
    ];
  };
}
