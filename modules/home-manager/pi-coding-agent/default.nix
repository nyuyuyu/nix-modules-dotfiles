{ config, lib, ... }:

{
  config.home = {
    shellAliases = {
      pi = "nix shell nixpkgs#bun -c bunx --ignore-scripts @earendil-works/pi-coding-agent@latest";
    };

    file.".pi/agent/settings.json".text = builtins.toJSON {
      collapseChangelog = true;
      defaultThinkingLevel = "medium";
      enableInstallTelemetry = false;
      fullscreenScrollbar = "hidden";
      hideThinkingBlock = true;
      quietStartup = true;
      showCacheMissNotices = true;
      theme = "system";
    };
  };

  config.programs.tmux.extraConfig = lib.mkIf config.programs.tmux.enable ''
    set -g extended-keys on
    set -g extended-keys-format csi-u
  '';
}
