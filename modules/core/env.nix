_:

{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      GTK_USE_PORTAL = "1";
    };
    shellAliases = {
      killall = "pkill";
      du = "ncdu --color dark-bg --show-graph --show-percent -2 -x";
    };
  };
}
