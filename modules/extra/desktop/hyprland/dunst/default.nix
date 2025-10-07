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
    services.dunst = {
      enable = true;
      configFile = ./dunstrc;
      waylandDisplay = "1";
      iconTheme = {
        name = "Papirus-Dark";
        size = "32x32";
        package = pkgs.papirus-icon-theme;
      };
    };

    systemd.user.services.dunst.Service.ExecStart = lib.mkForce "${pkgs.coreutils}/bin/echo 1";
  };
}
