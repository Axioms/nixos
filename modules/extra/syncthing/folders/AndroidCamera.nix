{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home-manager.users."${config.syncthing.username
  }".services.syncthing.settings.folders.AndroidCamera =
    {
      enable = false;
      id = "pixel_hr41-photos";
      label = "Android Camera";
      path = "/home/axiom/Android Camera";
      type = "sendreceive";
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Libra"
        "Virgo"
      ];
    };
}
