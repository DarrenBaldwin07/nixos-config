{
  description = "Darren Baldwin's NixOS system configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      overlays = [ ];

      mkSystem = import ./lib/mksystem.nix {
        inherit inputs nixpkgs overlays;
      };
    in
    {
      nixosConfigurations.nixos = mkSystem "nixos" {
        system = "x86_64-linux";
        user = "darrenb";
      };
    };
}
