{
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    rofi
  ];

  home-manager.users.axiom = {
    programs.rofi = {
      enable = true;
      theme = ./theme.rasi;
      extraConfig = {
        "show-icons" = true;
        "display-ssh" = " ";
        "display-run" = " ";
        "display-drun" = " ";
        "display-window" = " ";
        "display-combi" = " ";
        "display-calc" = " ";
        "display-emoji" = " ";
      };

      modes = [
        "keys"
        "filebrowser"
        "emoji"
        "games"
        "nerdy"
        "calc"
        "window"
        "drun"
        "run"
        #{
        #  name = "vpn";
        #  path = lib.getExe pkgs.rofi-vpn;
        #}
        #{
        #  name = "bluetooth";
        #  path = lib.getExe pkgs.rofi-bluetooth;
        #}
        #{
        #  name = "Vol";
        #  path = lib.getExe pkgs.pwmenu;
        #}
      ];

      plugins = with pkgs; [
        rofi-emoji
        rofi-network-manager
        rofi-games
        rofi-vpn
        rofi-bluetooth
        rofi-nerdy
        rofi-calc
        pwmenu
      ];
    };
  };
}
