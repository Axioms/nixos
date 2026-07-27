{
  lib,
  pkgs,
  config,
  ...
}:

{

  # Optional; hint electron apps to use wayland=
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  home-manager.users."${config.system.PrimaryUser}" = {
    services.swaync = {
      enable = true;
    };
  };
}
