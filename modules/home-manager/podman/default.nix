{ config, lib, pkgs, ... }:

let
  moduleConfig = config.podman.machine;
in
{
  imports = [
    ./darwin.nix
    ./linux.nix
  ];

  options.podman.machine = {
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.podman;
      description = "Podman package used for machine lifecycle commands.";
    };
    cpus = lib.mkOption {
      type = lib.types.int;
      default = 2;
      description = "Number of CPUs for the podman machine.";
    };
    memory = lib.mkOption {
      type = lib.types.int;
      default = 2048;
      description = "Memory in MB for the podman machine.";
    };
    diskSize = lib.mkOption {
      type = lib.types.int;
      default = 10;
      description = "Disk size in GB for the podman machine.";
    };
  };

  config.home = {
    packages = [
      pkgs.podman
    ];

    file.".config/containers/registries.conf".text = ''
      unqualified-search-registries = ["docker.io"]
    '';

    activation = {
      ensureContainersRemoteConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
        CONF="$HOME/.config/containers/containers.conf"
        $DRY_RUN_CMD mkdir -p "$HOME/.config/containers"
        if ! test -f "$CONF"; then
          $DRY_RUN_CMD touch "$CONF"
        fi
        if ! grep -q '^\[engine\]' "$CONF"; then
          $DRY_RUN_CMD printf '\n[engine]\n' >> "$CONF"
        fi
        if ! grep -q '^remote[[:space:]]*=' "$CONF"; then
          $DRY_RUN_CMD sed -i '/^\[engine\]/a remote = true' "$CONF"
        fi
      '';

      initPodmanMachine = lib.hm.dag.entryAfter ["writeBoundary"] ''
        PODMAN="${moduleConfig.package}/bin/podman"
        if ! $PODMAN machine list --format "{{.Name}}" | grep -E -q "^podman-machine-default\*?$"; then
          $DRY_RUN_CMD $PODMAN machine init \
            --cpus ${toString moduleConfig.cpus} \
            --memory ${toString moduleConfig.memory} \
            --disk-size ${toString moduleConfig.diskSize}
        fi
      '';
    };

    shellAliases = {
      docker = "podman";
    };
  };
}
