# nix-modules-dotfiles

Reusable [Home Manager](https://github.com/nix-community/home-manager) modules
for my own use.

This repository contains only modules and is meant to be referenced from other
flake-based configuration repositories. It is intentionally **not** a flake.

## Requirements

Consuming flakes must provide both stable and unstable package sets:

- `pkgs`: built from stable nixpkgs.
- `pkgsUnstable`: built from nixpkgs-unstable and passed via `extraSpecialArgs`.

Some modules depend on package versions that exist only in nixpkgs-unstable,
so there is intentionally no fallback to stable packages.

Modules that need unstable packages declare `{ pkgsUnstable, ... }:`.

## Usage

Add this repository as a flake input with `flake = false`,
alongside stable and unstable nixpkgs:

```nix
{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    nixpkgs-unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    dotfiles = {
      url = "github:nyuyuyu/nix-modules-dotfiles";
      flake = false;
    };
  };
}
```

Pass both package sets to Home Manager:

```nix
extraSpecialArgs = {
  inherit inputs;
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = x86_64-linux;
    config.allowUnfree = true;
  };
};
```

Then import the modules you need. For example, the `fish` module:

```nix
{ inputs, ... }:

{
  imports = [
    "${inputs.dotfiles}/modules/home-manager/fish"
  ];
}
```

Modules are located under `modules/home-manager/`.
