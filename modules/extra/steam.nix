{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
    dedicatedServer.openFirewall = true;
    remotePlay.openFirewall = true;

    extraPackages = with pkgs; [
      kdePackages.breeze-icons
      kdePackages.breeze
    ];
  };
}
