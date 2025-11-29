{
  pkgs,
  inputs,
  system,
  ...
}:
{

  environment.sessionVariables.DEFAULT_BROWSER = "${inputs.zen-browser.packages.x86_64-linux.beta}/bin/zen-beta";

  # Portals
  home-manager.users.axiom = {
    xdg = {
      mimeApps = {
        enable = true;
        associations.added = {
          "inode/directory" = [ "org.kde.dolphin.desktop" ];
        };

        defaultApplications = {
          "inode/directory" = [ "org.kde.dolphin.desktop" ];
        };
      };

      portal = {
        config = {
          common = {
            default = [
              "kde"
              "gtk"
              "gnome"
            ];
          };
          common."org.freedesktop.impl.portal.Secret" = [ "kwallet" ];
          common."org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
          common."org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];

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
    };
  };

  xdg.menus.enable = true;
  xdg.mime.enable = true;

  # A cool app to test a DE for which portals it support
  # https://flathub.org/apps/com.belmoussaoui.ashpd.demo
  environment.systemPackages = with pkgs; [ ashpd-demo ];
}
