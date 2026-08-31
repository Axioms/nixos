{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    curl
    fastfetch
    sbctl
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

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 50000;
    extraConfig = ''
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix
      set -g mouse on
      set -g status-position top
      set -g status-interval 5
      set -g status-left " #S "
      set -g status-right " %H:%M %d-%b "
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -g pane-border-style "fg=#565f89"
      set -g pane-active-border-style "fg=#bb9af7"
    '';

  };
}
