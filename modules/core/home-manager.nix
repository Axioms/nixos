{
  config,
  options,
  lib,
  input,
  ...
}:

{
  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "bak";
  };
}
