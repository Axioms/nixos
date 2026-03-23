{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.School.path = lib.mkOption {
      default = "/mnt/data/drive";
      type = lib.types.str;
    };

    syncthing-module.School.type = lib.mkOption {
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
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.School = {
      enable = true;
      id = "73nfo-5y9fc";
      label = "School";
      inherit (config.syncthing-module.School) path;
      inherit (config.syncthing-module.School) type;
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Libra"
        "Virgo"
      ];
    };
  };
}
