{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    comma
    curl
    fastfetch
    sbctl
    tmux
    vulnix
    linuxHeaders
    nvd
    nix-output-monitor
    statix
    usbutils
  ];

  environment.shellAliases = {
    killall = "pkill";
  };
}
