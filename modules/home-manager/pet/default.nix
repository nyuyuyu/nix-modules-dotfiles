{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../fzf
  ];

  home = {
    packages = [
      pkgs.pet
    ];
  };

  xdg.configFile."pet/config.toml".source = ./config.toml;
  xdg.configFile."pet/snippet.toml".source = ./snippet.toml;
}
