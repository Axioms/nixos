{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Boox.addresses = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };
  config = {
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Boox = {
      id = "FZ4MKVT-CNT6EQ6-2URASAO-OIHO6JG-O2QJN5V-3QGPGPB-UG4DFII-NH4RHAI";
      addresses = lib.mkIf (
        config.syncthing-module.Boox.addresses != [ ]
      ) config.syncthing-module.Boox.addresses;
    };
  };
}
