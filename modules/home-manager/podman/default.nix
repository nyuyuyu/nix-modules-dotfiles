{ pkgs, ... }:

{
  imports = [
    ./darwin.nix
  ];

  home = {
    packages = [
      pkgs.podman
    ];

    shellAliases = {
      docker = "podman";
    };
  };
}
