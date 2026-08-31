{
  pkgs,
  inputs,
  config,
  ...
}:
{

  environment = {
    sessionVariables.DEFAULT_BROWSER = "${inputs.zen-browser.packages.x86_64-linux.beta}/bin/zen-beta";
    pathsToLink = [
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];
  };
  # Portals use echo $XDG_DATA_DIRS to find and xdg-mime or file -i
  home-manager.users."${config.system.PrimaryUser}" = {
    xdg = {
      mimeApps = {
        enable = true;
        associations.added = {
          "inode/directory" = [ "org.kde.dolphin.desktop" ];
          "application/zip" = [ "org.kde.ark.desktop" ];
          "text/csv" = [ "codium.desktop" ];
          "text/x-c" = [ "codium.desktop" ];
          "text/plain" = [ "org.kde.kate.desktop" ];
          "application/json" = [ "org.kde.kate.desktop" ];
        };

        defaultApplications = {
          "inode/directory" = [ "org.kde.dolphin.desktop" ];
          "application/zip" = [ "org.kde.ark.desktop" ];
          "text/csv" = [ "codium.desktop" ];
          "text/x-c" = [ "codium.desktop" ];
          "text/plain" = [ "org.kde.kate.desktop" ];
          "application/json" = [ "org.kde.kate.desktop" ];
          "image/*" = [ "org.kde.gwenview.desktop" ];
          "image/png" = [ "org.kde.gwenview.desktop" ];
          "image/jpeg" = [ "org.kde.gwenview.desktop" ];
          "image/gif" = [ "org.kde.gwenview.desktop" ];
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

          kde = {
            default = [
              "kde"
              "gtk"
              "gnome"
            ];
            "org.freedesktop.portal.FileChooser" = [ "kde" ];
            "org.freedesktop.portal.OpenURI" = [ "kde" ];
          };
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
