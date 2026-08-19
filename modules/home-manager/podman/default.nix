{ pkgs, ... }:

{
  imports = [
    ./darwin.nix
  ];

  config.home = {
    packages = [
      pkgs.podman
    ];

    shellAliases = {
      docker = "podman";
    };
  };
}
