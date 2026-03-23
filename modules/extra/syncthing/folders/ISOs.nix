{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.ISOs.path = lib.mkOption {
      default = "/mnt/data/ISOs";
      type = lib.types.str;
    };

    syncthing-module.ISOs.type = lib.mkOption {
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

    home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.ISOs = {
      enable = true;
      id = "kscza-5qpec";
      label = "ISOs";
      inherit (config.syncthing-module.ISOs) path;
      inherit (config.syncthing-module.ISOs) type;
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Libra"
        "Virgo"
      ];
    };
  };
}
