{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Music = {
    enable = true;
    id = "dn22o-zmjw9";
    label = "Music";
    path = "/home/axiom/Music";
    type = "sendreceive";
    overrideFolders = false;

    devices = [
      "Acquarius"
      "Libra"
      "Virgo"
    ];
  };
}
