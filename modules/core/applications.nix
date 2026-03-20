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
  ];

  environment.shellAliases = {
    killall = "pkill";
    du = "ncdu --color dark-bg --show-graph --show-percent -2 -x";
  };
}
