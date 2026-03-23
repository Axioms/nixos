{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Music.path = lib.mkOption {
      default = "/home/axiom/Music";
      type = lib.types.str;
    };

    syncthing-module.Music.type = lib.mkOption {
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
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Music = {
      enable = true;
      id = "dn22o-zmjw9";
      label = "Music";
      path = config.syncthing-module.Music.path;
      type = config.syncthing-module.Music.type;
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Libra"
        "Virgo"
      ];
    };
  };
}
