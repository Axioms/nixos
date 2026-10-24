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
      extest.enable = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
      extraPackages = with pkgs; [
        kdePackages.breeze-icons
        kdePackages.breeze
        gamescope
        steam-devices-udev-rules
        dualsensectl
        lsfg-vk
        lsfg-vk-ui
        gdk-pixbuf
      ];
    };
    appimage = {
      enable = true;
      binfmt = true;

    };
  };

  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    unstable.protonup-qt
    gamescope
    steam-devices-udev-rules
    dualsensectl
    lsfg-vk
    lsfg-vk-ui
  ];
}
