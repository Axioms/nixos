{
  pkgs,
  inputs,
  ...
}:

{
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.plasma6.enableQt5Integration = true;

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-workspace
    kdePackages.kdeplasma-addons
    kdePackages.kservice
    kdePackages.wallpaper-engine-plugin
    kdePackages.sddm-kcm
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    kdePackages.xdg-desktop-portal-kde
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.baloo-widgets
    kdePackages.baloo
    kde-rounded-corners
    tela-icon-theme
  ];
  home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
  home-manager.users.axiom = import ./config.nix;
}
