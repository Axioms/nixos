{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    birdtray
    #unstable.bitwarden-desktop # TODO: Use Stable
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
    proton-vpn
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
    #unstable.obsidian # TODO: Use Stable
    guvcview
  ];

  programs.nix-ld.enable = true;
  programs.partition-manager.enable = true;
}
