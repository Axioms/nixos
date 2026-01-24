{
  config,
  ...
}:

{
  home-manager.users."${config.syncthing.username
  }".services.syncthing.settings.folders.EmuDeck-Saves =
    {
      enable = false;
      id = "npfo4-zh4fq";
      label = "EmuDeck-Saves";
      path = "/mnt/data/emuDeck-Saves";
      type = "sendreceive";
      overrideFolders = false;

      devices = [
        "Acquarius"
        "Libra"
        "Virgo"
      ];
    };
}
