{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Library.path = lib.mkOption {
      default = "/mnt/data/Library";
      type = lib.types.str;
    };

    syncthing-module.Library.type = lib.mkOption {
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
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Library = {
      enable = true;
      id = "e3sy5-yvrr3";
      label = "Library";
      path = config.syncthing-module.Library.path;
      type = config.syncthing-module.Library.type;
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Libra"
        "Virgo"
      ];
    };
  };
}
