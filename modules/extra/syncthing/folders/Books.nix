{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Books = {
    enable = false;
    id = "01db6-wir5u";
    label = "Books";
    path = "/mnt/data/e-reader-books";
    type = "sendreceive";
    overrideFolders = false;

    devices = [
      "Boox"
      "Libra"
      "Virgo"
    ];
  };
}
