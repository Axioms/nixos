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
  ];

  environment.shellAliases = {
    killall = "pkill";
  };
}
