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
          OnCalendar = "*:0/20";
          Unit = "hyprpaper-wallpaper";
        };
        Install = {
          WantedBy = [ "multi-user.target" ];
        };
      };
    };
  };
}
