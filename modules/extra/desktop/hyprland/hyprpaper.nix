{
  config,
  options,
  lib,
  pkgs,
  uPkgs,
  inputs,
  ...
}:

{

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    hyprpaper
  ];

  home-manager.users.axiom = {

    home.file."wallpaper.sh" = {
      enable = true;
      executable = true;
      source = ./wallpaper.sh;
      target = ".share/hypaper/wallpaper.sh";
    };

    home.file."hyprpaper.conf" = {
      enable = true;
      executable = true;
      text = "";
      target = ".config/hypr/hyprpaper.conf";
    };

    systemd.user = {
      services.hyprpaper-wallpaper = {
        Unit = {
          Description = "hyprpaper";
          After = [ ];
          PartOf = [ ];
        };
        Service = {
          Type = "oneshot";
          ExecStart = "/home/axiom/.share/hypaper/wallpaper.sh";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
      };
      timers.wallpaper = {
        Unit = {
          Description = "wallpaper every 20 minutes";
        };
        Timer = {
          OnCalendar = "*:0/1";
          Unit = "hyprpaper-wallpaper.service";
        };
        Install = {
          WantedBy = [ "multi-user.target" ];
        };
      };
    };
  };
}
