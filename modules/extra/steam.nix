{ pkgs, ... }:

{
  programs = {
    gamescope = {
      enable = true;
      capSysNice = false;
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
        gamescope
        steam-devices-udev-rules
        dualsensectl
      ];
    };

    appimage = {
      enable = true;
      binfmt = true;

    };
  };

  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-qt
    gamescope
    steam-devices-udev-rules
    dualsensectl
  ];
}
