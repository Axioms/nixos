{ pkgs, ... }:
{
  # Portals
  home-manager.users.axiom.xdg.portal = {
    config = {
      common.default = [
        "kde"
        "gtk"
        "gnome"
      ];
      common."org.freedesktop.impl.portal.Secret" = [
        "kwallet"
      ];
      kde.default = [
        "kde"
        "gtk"
        "gnome"
      ];
      kde."org.freedesktop.portal.FileChooser" = [ "kde" ];
      kde."org.freedesktop.portal.OpenURI" = [ "kde" ];
    };

    extraPortals = with pkgs.kdePackages; [
      kwallet
      xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    xdgOpenUsePortal = true;
    configPackages = [
      pkgs.kdePackages.plasma-workspace
      pkgs.hyprland
    ];
  };

  xdg.menus.enable = true;
  xdg.mime.enable = true;

  # A cool app to test a DE for which portals it support
  # https://flathub.org/apps/com.belmoussaoui.ashpd.demo
  environment.systemPackages = with pkgs; [ ashpd-demo ];
}
