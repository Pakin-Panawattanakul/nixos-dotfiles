{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      gamescope
    ];
  };

  environment.systemPackages = with pkgs; [
    lutris
  ];
}
