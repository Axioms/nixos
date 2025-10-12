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
      enable = true;
      id = "pixel_lf8i-backups";
      label = "Android Backup";
      path = "/mnt/data/Android Backup";
      type = "sendreceive";
      overrideFolders = false;

      devices = [
        "Pisces"
        "Libra"
        "Virgo"
      ];
    };
}
