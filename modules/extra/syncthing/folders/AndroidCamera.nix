{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.AndroidCamera.path = lib.mkOption {
      default = "/home/axiom/Android Camera";
      type = lib.types.str;
    };

    syncthing-module.AndroidCamera.type = lib.mkOption {
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
    }".services.syncthing.settings.folders.AndroidCamera =
      {
        enable = true;
        id = "pixel_hr41-photos";
        label = "Android Camera";
        path = config.syncthing-module.AndroidCamera.path;
        type = config.syncthing-module.AndroidCamera.type;
        overrideFolders = false;

        devices = [
          "Acquarius"
          "Libra"
          "Virgo"
        ];
      };
  };
}
