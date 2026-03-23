{
  config,
  lib,
  ...
}:

{
  options = {
    syncthing-module.Sagittarius.addresses = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };

  config = {
    home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Sagittarius =
      {
        id = "5EBX6GN-ILKBLNB-QEMB4KR-RENDTWY-ZU3TFYZ-6ADO7MR-3UBVDRQ-7MRHJAT";

        addresses = lib.mkIf (
          config.syncthing-module.Sagittarius.addresses != [ ]
        ) config.syncthing-module.Sagittarius.addresses;
      };
  };
}
