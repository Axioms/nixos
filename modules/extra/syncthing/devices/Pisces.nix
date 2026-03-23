{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Pisces.addresses = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };

  config = {
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Pisces = {
      id = "U3BCTJS-A2YJPAH-6RU4CLC-CB3XFJS-KN4GJAV-QPHOPDJ-UMGTLPC-R4OPRQ7";
      addresses = lib.mkIf (
        config.syncthing-module.Pisces.addresses != [ ]
      ) config.syncthing-module.Pisces.addresses;
    };
  };
}
