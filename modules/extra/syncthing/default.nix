{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    syncthing.username = lib.mkOption {
      type = lib.types.str;
    };
  };
  config = {
    home-manager.users."${config.syncthing.username}" = { pkgs, inputs, ... }: { };

  };
}
