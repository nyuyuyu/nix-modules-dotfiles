# nix-modules-dotfiles

Reusable [Home Manager](https://github.com/nix-community/home-manager) modules
for my own use.

This repository contains only modules and is meant to be referenced from other
flake-based configuration repositories. It is intentionally **not** a flake.

## Usage

Add this repository as a flake input with `flake = false`:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    dotfiles = {
      url = "github:nyuyuyu/nix-modules-dotfiles";
      flake = false;
    };
  };
}
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
