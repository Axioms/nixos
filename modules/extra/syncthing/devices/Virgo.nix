{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Virgo.addresses = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };

  config = {
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Virgo = {
      id = "MPERAJV-UPPT2FF-G45BBOA-7VQDK36-FEAT5Y3-5MXIZ3X-GVUPQTG-EE2MIQT";
      addresses = lib.mkIf (
        config.syncthing-module.Virgo.addresses != [ ]
      ) config.syncthing-module.Virgo.addresses;
    };
  };
}
