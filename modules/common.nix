{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  virtualisation.docker.enable = true;

  programs.firefox.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      claude = "claude --dangerously-skip-permissions";
      codex = "codex --dangerously-bypass-approvals-and-sandbox";
      rebuild = "sudo nixos-rebuild switch --flake /home/darrenb/Documents/coding/nixos-config#nixos";
      nixsync = "cd /home/darrenb/Documents/coding/nixos-config && git pull --ff-only && sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake .#nixos";
    };
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "sudo"
        "z"
        "docker"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    claude-code
    tailscale
    slack
    code-cursor
    google-chrome
    ghostty
    git
    gh
    qemu
    rofi
    pnpm
    nodejs
    bun
    infisical
    docker
    frp
    openssl
    pkg-config
  ];

  services.tailscale.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
}
