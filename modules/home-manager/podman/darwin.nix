{ lib, pkgs, ... }:

let
  podmanMachineName = "podman-machine-default";
in
lib.mkIf pkgs.stdenv.isDarwin {
  home.activation = {
    initPodmanMachine = lib.hm.dag.entryAfter ["writeBoundary"] ''
      PODMAN="${pkgs.podman}/bin/podman"
      if ! $PODMAN machine list --format "{{.Name}}" | grep -E -q "^${podmanMachineName}\*?$"; then
        $DRY_RUN_CMD $PODMAN machine init --memory 4096
      fi
    '';
  };

  launchd.agents.podman = {
    enable = true;

    config = {
      AbandonProcessGroup = true;
      RunAtLoad = true;
      ProgramArguments = [
        "${pkgs.podman}/bin/podman"
        "machine"
        "start"
        "${podmanMachineName}"
      ];
      StandardOutPath = "/tmp/podman.out.log";
      StandardErrorPath = "/tmp/podman.err.log";
      Timeout = 60;
    };
  };
}
