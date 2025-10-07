{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Downloads = {
    enable = false;
    id = "qovpu-t2awa";
    label = "Downloads";
    path = "/home/axiom/Downloads";
    type = "sendreceive";
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
}
