{ pkgs, ... }:

{
  config.programs.antigravity-cli = {
    enable = true;
  };

  # config.home.file.".gemini/antigravity-cli/settings.json".source = ./settings.json;
}
