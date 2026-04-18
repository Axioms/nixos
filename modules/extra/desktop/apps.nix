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
    mpv
    nextcloud-client
    #nvtopPackages.full
    protonvpn-gui
    unstable.sone
    streamcontroller
    distrobox
    syncthingtray
    vesktop
    #ventoy-bin-full
    veracrypt
    wl-clicker
    unstable.wiremix
    jq
    unstable.grayjay
    obsidian
  ];

  programs.nix-ld.enable = true;
  programs.partition-manager.enable = true;
}
