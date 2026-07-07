{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    birdtray
    #unstable.bitwarden-desktop # TODO: Use Stable
    deskflow
    jellyfin-desktop
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
    vesktop
    #ventoy-bin-full
    veracrypt
    wl-clicker
    unstable.wiremix
    jq
    unstable.grayjay
    #unstable.obsidian # TODO: Use Stable
    guvcview
    drawy
    kdePackages.kcalc
    element-desktop
    fluffychat
    cinny-desktop
  ];

  programs.nix-ld.enable = true;
  programs.partition-manager.enable = true;
}
