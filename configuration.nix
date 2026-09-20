# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/udev.nix
    ./modules/tmux.nix
    ./modules/game.nix
  ];

  nixpkgs.overlays = [
    # spotdl forces YTMusic(language="de"); localized ("Titel") shelf titles
    # make ytmusicapi drop all songs-filter results. Default to en.
    (final: prev: {
      spotdl = prev.spotdl.overrideAttrs (old: {
        postPatch = (old.postPatch or "") + ''
          substituteInPlace spotdl/providers/audio/ytmusic.py \
            --replace-fail 'return YTMusic(language="de")' 'return YTMusic()'
        '';
      });
    })
  ];

  # allow uneree software
  nixpkgs.config.allowUnfree = true;

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';

  # Set your time zone.
  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    graphics.enable = true;

    logitech.wireless.enable = true;
  };

  services = {
    # dbus: usually already true by default
    dbus.enable = true;

    # Enable sound.
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    udisks2.enable = true;

    fwupd.enable = true;
  };

  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib
        zstd
        stdenv.cc.cc
        stdenv.cc.cc.lib
        curl
        openssl
        attr
        libssh
        bzip2
        libxml2
        acl
        libsodium
        util-linux
        xz
        systemd

      ];
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pakin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  documentation.man = {
    enable = true;
    cache.enable = true;
  };

  users.defaultUserShell = pkgs.bash;
  programs.zsh.enable = true;
  users.users.pakin.shell = pkgs.zsh;

  # system packages
  environment.systemPackages = with pkgs; [
    curl
    solaar
    file
    libinput
    seahorse
  ];

  security.pam.services.waylock = { };
  # gnome keyring
  services.gnome.gnome-keyring.enable = true;
  programs.geary.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  system.stateVersion = "26.05";
}
