{ inputs, nixpkgs, overlays ? [ ] }:

name:
{ system
, user
, ...
}:

nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit inputs user;
  };

  modules = [
    ../machines/${name}/configuration.nix
    {
      nixpkgs.overlays = overlays;
    }
  ];
}
