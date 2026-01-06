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
    nvd
    nix-output-monitor
  ];

  environment.shellAliases = {
    killall = "pkill";
  };
}
