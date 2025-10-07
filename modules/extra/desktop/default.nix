{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  programs.kdeconnect.enable = true;

  imports = [
    ./xdg.nix
  ];
}
