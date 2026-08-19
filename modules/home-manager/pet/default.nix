{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../fzf
  ];

  config.home = {
    packages = [
      pkgs.pet
    ];
  };

  config.xdg.configFile."pet/config.toml".source = ./config.toml;
  config.xdg.configFile."pet/snippet.toml".source = ./snippet.toml;
}
