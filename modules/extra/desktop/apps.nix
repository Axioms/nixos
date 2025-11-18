{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    birdtray
    deskflow
    jellyfin-media-player
    looking-glass-client
    kdePackages.ark
    kdePackages.filelight
    kdePackages.full
    kdePackages.kcmutils
    kdePackages.partitionmanager
    kdePackages.dolphin
    mission-center
    mpv
    nextcloud-client
    nvtopPackages.full
    spotify
    streamdeck.streamcontroller
    distrobox
    syncthingtray
    vesktop
    #ventoy-bin-full
    veracrypt
    #vscode
    unstable.wiremix
    jq
    grayjay
  ];

  programs.nix-ld.enable = true;

}
