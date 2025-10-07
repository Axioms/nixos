{
  config,
  pkgs,
  inputs,
  ...
}:

{

  home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Pisces = {
    id = "U3BCTJS-A2YJPAH-6RU4CLC-CB3XFJS-KN4GJAV-QPHOPDJ-UMGTLPC-R4OPRQ7";
  };
}
