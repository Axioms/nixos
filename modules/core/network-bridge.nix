{
  config,
  lib,
  ...
}:

{
  options = {
    network-module.bridge.devices = lib.mkOption {
      type = lib.types.listOf lib.types.str;
    };
  };

  config = {
    networking = {
      bridges.bridge0.interfaces = config.network-module.bridge.devices;
      useDHCP = lib.mkDefault false;
      interfaces.bridge0.useDHCP = lib.mkDefault true;
      enableIPv6 = false;
    };
  };
}
