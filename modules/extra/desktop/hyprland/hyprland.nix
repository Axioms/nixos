{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    hyprland.settings = {
      monitor = lib.mkOption {
        type = lib.types.str;
        default = ''
          hl.monitor({output = "", mode = "preferred", position = "auto", scale = "auto", mirror = "DP-1"})
        '';
      };
      autostart = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
      };
      enableDefaultWallPaper = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
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
      hyprlandPlugins.hypr-dynamic-cursors
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
          text =
            builtins.replaceStrings
              [ "--AUTOSTART" ]
              [ "${lib.concatMapStrings (b: "hl.exec_cmd(\"" + b + "\")\n") config.hyprland.settings.autostart}" ]
              (builtins.readFile ./config/autostart.lua);
          target = ".config/hypr/config/autostart.lua";
        };
        "displays.lua" = {
          enable = true;
          executable = true;
          text = builtins.replaceStrings [ "--MONITORS" ] [ "${config.hyprland.settings.monitor}" ] (
            builtins.readFile ./config/displays.lua
          );
          target = ".config/hypr/config/displays.lua";
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
        "input.lua" = {
          enable = true;
          executable = true;
          source = ./config/input.lua;
          target = ".config/hypr/config/input.lua";
        };
        "keybinds.lua" = {
          enable = true;
          executable = true;
          text =
            builtins.replaceStrings
              [
                "ROFIGAMESTHEMERASI"
                "LIBGETEXEPKGSROFIBLUETOOTH"
                "LIBGETEXEPKGSROFIVPN"
                "LIBGETEXEPKGSROFINETWORKMANAGER"
              ]
              [
                "${./rofi/games-theme.rasi}"
                "${lib.getExe pkgs.rofi-bluetooth}"
                "${lib.getExe pkgs.rofi-vpn}"
                "${lib.getExe pkgs.rofi-network-manager}"
              ]
              (builtins.readFile ./config/keybinds.lua);
          target = ".config/hypr/config/keybinds.lua";
        };
        "lookAndFeel.lua" = {
          enable = true;
          executable = true;
          source = ./config/lookAndFeel.lua;
          target = ".config/hypr/config/lookAndFeel.lua";
        };
        "main.lua" = {
          enable = true;
          executable = true;
          text =
            builtins.replaceStrings
              [ "-1" "true" ]
              [
                "${if config.hyprland.settings.enableDefaultWallPaper then "-1" else "0"}"
                "${if config.hyprland.settings.enableDefaultWallPaper then "false" else "true"}"
              ]
              (builtins.readFile ./config/main.lua);
          target = ".config/hypr/config/main.lua";
        };
        "permissions.lua" = {
          enable = true;
          executable = true;
          source = ./config/permissions.lua;
          target = ".config/hypr/config/permissions.lua";
        };
        "windowRules.lua" = {
          enable = true;
          executable = true;
          source = ./config/windowRules.lua;
          target = ".config/hypr/config/windowRules.lua";
        };
      };

      services.easyeffects.enable = true;
      wayland.windowManager.hyprland = {
        enable = true;
        plugins = [ pkgs.hyprlandPlugins.hypr-dynamic-cursors ];
        configType = "lua";
        extraConfig = ''
          require("config/main")
        '';
      };
    };

  };
}
