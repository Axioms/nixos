{
  config,
  ...
}:

{
  home-manager.users."${config.syncthing.username
  }".services.syncthing.settings.folders.AndroidBackup =
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
