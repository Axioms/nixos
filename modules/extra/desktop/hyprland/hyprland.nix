{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    hyprland.settings.monitor = lib.mkOption {
      type = lib.types.str;
      default = ''
        monitor=,preferred,auto,1,mirror,DP-1
      '';
    };
    hyprland.settings.autostart = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };
  config = {

    environment.systemPackages = with pkgs; [
      libsForQt5.qt5ct
      kdePackages.qt6ct
      nwg-look
      networkmanagerapplet
      wl-clipboard
      kdePackages.kdeconnect-kde
      hyprcursor
      rose-pine-hyprcursor
      ddcutil
      xdg-desktop-portal-wlr
      cliphist
      grimblast
      shared-mime-info
      nix-hyprcursor.hyprlandPlugins.hypr-dynamic-cursors # TODO: revert
      hyprpolkitagent
      hyprpwcenter
      hyprsysteminfo
    ];

    programs = {
      hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
      };
      iio-hyprland.enable = true;

      dconf.profiles.user.databases = [
        {
          settings."org/gnome/desktop/interface" = {
            gtk-theme = "Adwaita";
            icon-theme = "Flat-Remix-Red-Dark";
            font-name = "SF Pro 10";
            document-font-name = "SF Pro 10";
            monospace-font-name = "JetBrainsMono Nerd Font Mono 10";
          };
        }
      ];
    };

    # This fixes the unpopulated MIME menus

    # Optional, hint electron apps to use wayland:
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    home-manager.users.axiom = {
      home.file = {
        "autostart.lua" = {
          enable = true;
          executable = true;
          source = ./config/autostart.lua;
          target = ".config/hypr/config/autostart.lua";
        };
        "env.lua" = {
          enable = true;
          executable = true;
          source = ./config/env.lua;
          target = ".config/hypr/config/env.lua";
        };
        "hyprCursor.lua" = {
          enable = true;
          executable = true;
          source = ./config/hyprCursor.lua;
          target = ".config/hypr/config/hyprCursor.lua";
        };
        "main.lua" = {
          enable = true;
          executable = true;
          source = ./config/main.lua;
          target = ".config/hypr/config/main.lua";
        };
      };

      services.easyeffects.enable = true;
      wayland.windowManager.hyprland = {
        enable = true;
        plugins = [ pkgs.nix-hyprcursor.hyprlandPlugins.hypr-dynamic-cursors ]; # TODO: revert
        configType = "lua";
        extraConfig = ''
          require(config.main)
        '';
      };
    };

  };
}
