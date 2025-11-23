{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{

  # Optional; hint electron apps to use wayland=
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  home-manager.users.axiom = {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          "label" = "lock";
          "action" = "hyprlock";
        }

        {
          "label" = "logout";
          "action" = "hyprctl dispatch exit";
        }

        {
          "label" = "shutdown";
          "action" = "shutdown -h now";
        }

        {
          "label" = "reboot";
          "action" = "reboot";
        }
      ];

      style = ''
        * {
          background-image: none;
        }

        window {
          background-color: rgba(25, 0, 46, 0.5);
        }

        button {
          color: rgb(255, 14, 130);
          font-size: 16px;
          background-color: rgb(36, 0, 65);
          border-style: none;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 10%;
          border-radius: 30px;
          margin: 500px 75px;
          text-shadow: 0px 0px;
          box-shadow: 0px 0px;
        }

        button:hover {
          background-color: rgb(144, 0, 72);
          outline-style: none;
        }

        #lock {
          background-image: image(url("${../assets/wlogout/lock.png}"));
        }

        #logout {
          background-image: image(url("${../assets/wlogout/logout.png}"));
        }

        #shutdown {
          background-image: image(url("${../assets/wlogout/power.png}"));
        }

        #reboot {
          background-image: image(url("${../assets/wlogout/restart.png}"));
        }
      '';
    };
  };
}
