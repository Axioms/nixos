{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    curl
    fastfetch
    sbctl
    tmux
    vulnix
    linuxHeaders
    ncdu
    nvd
    nix-output-monitor
    statix
    usbutils
    statix
    p7zip
    unrar
    exfatprogs
    usbeehive
  ];
}
