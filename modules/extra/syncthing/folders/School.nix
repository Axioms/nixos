{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.folders.School = {
    enable = true;
    id = "73nfo-5y9fc";
    label = "School";
    path = "/mnt/data/drive";
    type = "sendreceive";
    overrideFolders = false;

    devices = [
      "Acquarius"
      "Libra"
      "Virgo"
    ];
  };
}
