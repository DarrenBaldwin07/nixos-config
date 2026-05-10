{ pkgs, ... }:

{
  users.users.darrenb = {
    isNormalUser = true;
    description = "Darren Baldwin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "kvm"
      "docker"
    ];
    shell = pkgs.zsh;
    packages = [ ];
  };
}
