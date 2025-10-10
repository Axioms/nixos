{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Library = {
    enable = true;
    id = "e3sy5-yvrr3";
    label = "Library";
    path = "/mnt/data/Library";
    type = "sendreceive";
    overrideFolders = false;

    devices = [
      "Acquarius"
      "Libra"
      "Virgo"
    ];
  };
}
