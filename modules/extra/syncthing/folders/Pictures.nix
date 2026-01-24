{
  config,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.Pictures = {
    enable = true;
    id = "0e165-3i136";
    label = "Pictures";
    path = "/home/axiom/Pictures";
    type = "sendreceive";
    overrideFolders = false;

    devices = [
      "Acquarius"
      "Libra"
      "Virgo"
    ];
  };
}
