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
    programs.waybar = {
      enable = true;
      settings = lib.lists.toList (builtins.fromJSON (builtins.readFile ./config.json));

      style = ./style.css;
    };
  };
}
