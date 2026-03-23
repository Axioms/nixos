{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.AndroidBackups.path = lib.mkOption {
      default = "/mnt/data/Android Backup";
      type = lib.types.str;
    };

    syncthing-module.AndroidBackups.type = lib.mkOption {
      default = "sendreceive";
      type = lib.types.enum [
        "sendreceive"
        "sendonly"
        "receiveonly"
        "receiveencrypted"
      ];
    };
  };

  config = {
    home-manager.users."${config.syncthing.username
    }".services.syncthing.settings.folders.AndroidBackup =
      {
        enable = true;
        id = "pixel_lf8i-backups";
        label = "Android Backup";
        inherit (config.syncthing-module.AndroidBackups) path;
        inherit (config.syncthing-module.AndroidBackups) type;
        overrideFolders = false;

        devices = [
          "Pisces"
          "Libra"
          "Virgo"
        ];
      };
  };
}
