{ pkgs, ... }:

{
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      dedicatedServer.openFirewall = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
      extraPackages = with pkgs; [
        kdePackages.breeze-icons
        kdePackages.breeze
      ];
    };

    appimage = {
      enable = true;
      binfmt = true;

    };
  };
  hardware.xone.enable = true; # support for the xbox controller USB dongle

  environment.systemPackages = with pkgs; [
    protonup-qt
    gamescope
  ];
}
