# NixOS System Configurations

This repository contains the NixOS configuration for Darren Baldwin's machines.

- `flake.nix` declares the available systems.
- `lib/mksystem.nix` builds each system from a machine name.
- `machines/` contains host-specific NixOS configuration.
- `modules/` contains shared system modules.
- `users/` contains user-specific configuration.

## Current Machines

- `nixos`: this machine, `x86_64-linux`

## Usage

Test a configuration:

```sh
make test
```

Apply a configuration:

```sh
make switch
```

The equivalent direct command is:

```sh
sudo nixos-rebuild switch --flake ".#nixos"
```
