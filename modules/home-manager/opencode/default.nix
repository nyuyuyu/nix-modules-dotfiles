{ ... }:

{
  config.home.shellAliases = {
    opencode = "nix run nixpkgs#opencode";
  };

  config.xdg.configFile."opencode/opencode.json".source = ./config.json;
}
