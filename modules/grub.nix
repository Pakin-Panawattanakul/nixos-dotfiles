{ config, pkgs, ... }:
{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      theme = pkgs.sleek-grub-theme.override {
        #withBanner = "NixOS";
        withStyle = "dark";
      };
    };
    efi.canTouchEfiVariables = true;
  };
}
