{ ... }:

{
  home.shellAliases = {
    opencode = "nix run nixpkgs#opencode";
  };

  xdg.configFile."opencode/opencode.json".source = ./config.json;
}
