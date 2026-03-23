{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Aries.addresses = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };
  config = {
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Aries = {
      id = "IQSEQKD-3GNY7VT-4GQEWEM-XK247KD-WSDGWKV-LL7JB6O-OGE3Y7X-FEUYOQC";
      addresses = lib.mkIf (
        config.syncthing-module.Aries.addresses != [ ]
      ) config.syncthing-module.Aries.addresses;
    };
  };
}
