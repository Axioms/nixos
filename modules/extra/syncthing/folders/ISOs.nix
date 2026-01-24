{
  config,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.ISOs = {
    enable = true;
    id = "kscza-5qpec";
    label = "ISOs";
    path = "/mnt/data/ISOs";
    type = "sendreceive";
    overrideFolders = false;

    devices = [
      "Acquarius"
      "Libra"
      "Virgo"
    ];
  };
}
