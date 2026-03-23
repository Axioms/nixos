{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Libra.addresses = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };

  config = {
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Libra = {
      id = "6S3FGWA-CF44VRL-D2PCKKP-ZNBLDOH-MKYRYNS-UTCBTMN-NGDIAYZ-G3ACFAX";
      addresses = lib.mkIf (
        config.syncthing-module.Libra.addresses != [ ]
      ) config.syncthing-module.Libra.addresses;
    };
  };
}
