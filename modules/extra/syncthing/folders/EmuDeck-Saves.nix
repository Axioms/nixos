{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.EmuDeck.path = lib.mkOption {
      default = "/mnt/data/emuDeck-Saves";
      type = lib.types.str;
    };

    syncthing-module.EmuDeck.type = lib.mkOption {
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
    }".services.syncthing.settings.folders.EmuDeck-Saves =
      {
        enable = false;
        id = "npfo4-zh4fq";
        label = "EmuDeck-Saves";
        inherit (config.syncthing-module.EmuDeck) path;
        inherit (config.syncthing-module.EmuDeck) type;
        overrideFolders = false;

        devices = [
          "Acquarius"
          "Libra"
          "Virgo"
        ];
      };
  };
}
