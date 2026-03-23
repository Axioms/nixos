{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Books.path = lib.mkOption {
      default = "/mnt/data/e-reader-books";
      type = lib.types.str;
    };

    syncthing-module.Books.type = lib.mkOption {
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
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Books = {
      enable = true;
      id = "01db6-wir5u";
      label = "Books";
      path = config.syncthing-module.Books.path;
      type = config.syncthing-module.Books.type;
      overrideFolders = false;

      devices = [
        "Boox"
        "Libra"
        "Virgo"
      ];
    };
  };
}
