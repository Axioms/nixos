{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Obsidian.path = lib.mkOption {
      default = "/home/axiom/Documents/Obsidian";
      type = lib.types.str;
    };

    syncthing-module.Obsidian.type = lib.mkOption {
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
      id = "5sjry-yovao";
      label = "Obsidian";
      inherit (config.syncthing-module.Library) path;
      inherit (config.syncthing-module.Library) type;
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Aries"
        "Libra"
        "Sagittarius"
        "Virgo"
      ];
    };
  };
}
