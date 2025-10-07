{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    network-module.bridge.devices = lib.mkOption {
      type = lib.types.listOf lib.types.str;
    };
  };

  config = {
    networking.bridges.bridge0.interfaces = config.network-module.bridge.devices;
    networking.useDHCP = lib.mkDefault false;
    networking.interfaces.bridge0.useDHCP = lib.mkDefault true;
  };
}
