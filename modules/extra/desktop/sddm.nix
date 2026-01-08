{ config, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland-uwsm";
}
