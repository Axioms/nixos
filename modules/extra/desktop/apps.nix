{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    birdtray
    bitwarden-desktop
    deskflow
    jellyfin-media-player
    kdePackages.ark
    kdePackages.filelight
    kdePackages.kcmutils
    kdePackages.dolphin
    mission-center
    easyeffects
    mpv
    kdePackages.kmix
    qpwgraph
    nextcloud-client
    #nvtopPackages.full
    protonvpn-gui
    unstable.sone
    unstable.streamcontroller
    distrobox
    syncthingtray
    unstable.vesktop
    #ventoy-bin-full
    veracrypt
    wl-clicker
    unstable.wiremix
    jq
    unstable.grayjay
    obsidian
    guvcview
  ];

  programs.nix-ld.enable = true;
  programs.partition-manager.enable = true;
}
