{
  config,
  pkgs,
  inputs,
  ...
}:

{

  home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Virgo = {
    id = "MPERAJV-UPPT2FF-G45BBOA-7VQDK36-FEAT5Y3-5MXIZ3X-GVUPQTG-EE2MIQT";
  };
}
