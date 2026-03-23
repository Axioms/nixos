{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Pictures.path = lib.mkOption {
      default = "/home/axiom/Pictures";
      type = lib.types.str;
    };

    syncthing-module.Pictures.type = lib.mkOption {
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
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Pictures = {
      enable = true;
      id = "0e165-3i136";
      label = "Pictures";
      path = config.syncthing-module.Pictures.path;
      type = config.syncthing-module.Pictures.type;
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Libra"
        "Virgo"
      ];
    };
  };
}
