NIXNAME ?= nixos

.PHONY: test
test:
	sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild test --flake ".#$(NIXNAME)"

.PHONY: switch
switch:
	sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake ".#$(NIXNAME)"

.PHONY: build
build:
	NIXPKGS_ALLOW_UNFREE=1 nix build ".#nixosConfigurations.$(NIXNAME).config.system.build.toplevel"
