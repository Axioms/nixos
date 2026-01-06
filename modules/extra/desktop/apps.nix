{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    birdtray
    deskflow
    jellyfin-desktop
    looking-glass-client
    kdePackages.ark
    kdePackages.filelight
    kdePackages.kcmutils
    kdePackages.partitionmanager
    kdePackages.dolphin
    kdePackages.kmix
    mission-center
    mpv
    nextcloud-client
    nvtopPackages.full
    spotify
    streamdeck.streamcontroller
    distrobox
    syncthingtray
    #TODO: switch to unstable
    stable.vesktop
    #ventoy-bin-full
    veracrypt
    #vscode
    unstable.wiremix
    jq
    #TODO: switch to unstable
    stable.grayjay
  ];

  programs.nix-ld.enable = true;
}
