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
          label = "exit";
          action = "";
          text = "Exit";
          keybind = "h";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "lock";
          action = "hyprlockr";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "logout";
          action = "hyprctl dispatch exit";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];

      style = ''
              * {
            font-family: JetBrains Mono, Symbols Nerd Font;
            font-size: 24px;
            transition-property: background-color;
            transition-duration: 0.7s;
        }

        window {
            background-color: #11111b;
            /* border-radius: 10px; */
        }

        button {
            background-color: #11111b;
            border-style: solid;
            /* border-width: 2px; */
            border-radius: 50px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 15%;
            margin: 15px;
        }

        button:active,
        button:hover {
            background-color: #cdd6f4;
        }

        button:focus {
            background-color: #cdd6f4;
        }

        #lock {
            background-image: image(url("${../assets/wlogout/lock.png}"), url("${../assets/wlogout/lock.png}"));
        }

        #lock:hover {
            background-image: image(url("${../assets/wlogout/lock-hover.png}"), url("${../assets/wlogout/lock.png}"));
            color: #11111b;
        }

        #logout {
            background-image: image(url("${../assets/wlogout/logout.png}"), url("${../assets/wlogout/logout.png}"));
        }

        #logout:hover {
            background-image: image(url("${../assets/wlogout/logout-hover.png}"), url("${../assets/wlogout/logout.png}"));
            color: #11111b;
        }

        #suspend {
            background-image: image(url("${../assets/wlogout/sleep.png}"), url("${../assets/wlogout/sleep.png}"));
        }

        #suspend:hover {
            background-image: image(url("${../assets/wlogout/sleep-hover.png}"), url("${../assets/wlogout/sleep.png}"));
            color: #11111b;
        }

        #shutdown {
            background-image: image(url("${../assets/wlogout/power.png}"), url("${../assets/wlogout/power.png}"));
        }

        #shutdown:hover {
            background-image: image(url("${../assets/wlogout/power-hover.png}"), url("${../assets/wlogout/power-hover.png}"));
            color: #11111b;
        }

        #reboot {
            background-image: image(url("${../assets/wlogout/restart.png}"), url("${../assets/wlogout/restart.png}"));
        }

        #reboot:hover {
            background-image: image(url("${../assets/wlogout/restart-hover.png}"), url("${../assets/wlogout/restart.png}"));
            color: #11111b;
        }

        #exit {
            background-image: image(url("${../assets/wlogout/restart.png}"), url("${../assets/wlogout/restart.png}"));
            background-color: #11111b;

        }

        #exit:hover {
            background-image: image(url("${../assets/wlogout/restart-hover.png}"), url("${../assets/wlogout/restart.png}"));
            color: #11111b;
            background-color: #cdd6f4;
        }
      '';
    };
  };
}
