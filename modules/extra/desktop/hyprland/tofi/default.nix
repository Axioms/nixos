{
  pkgs,
  config,
  ...
}:

{

  # Optional; hint electron apps to use wayland=
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  home-manager.users."${config.system.PrimaryUser}" = {
    home.file."configA" = {
      enable = true;
      source = ./configA;
      target = ".share/tofi/configA";
    };

    home.file."configV" = {
      enable = true;
      source = ./configV;
      target = ".share/tofi/configV";
    };
  };

  environment.systemPackages = with pkgs; [
    tofi
  ];
}
