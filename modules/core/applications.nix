{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    curl
    fastfetch
    sbctl
    tmux
    vulnix
    linuxHeaders
  ];
}
