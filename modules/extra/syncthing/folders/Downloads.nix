{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Downloads.path = lib.mkOption {
      default = "/home/axiom/Downloads";
      type = lib.types.str;
    };

    syncthing-module.Downloads.type = lib.mkOption {
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
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Downloads = {
      enable = true;
      id = "qovpu-t2awa";
      label = "Downloads";
      inherit (config.syncthing-module.Downloads) path;
      inherit (config.syncthing-module.Downloads) type;
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Capricorn"
        "Libra"
        "Pisces"
        "Sagittarius"
        "Virgo"
      ];
    };
  };
}
