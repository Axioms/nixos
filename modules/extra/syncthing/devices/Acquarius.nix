{
  config,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Acquarius = {
    id = "Z44F7EC-5W73IEA-BQ2THHB-AF7RDEI-OBX3V4I-CDZ3W4O-GCKJD6L-3AJSWAH";
    addresses = [
      "tcp://10.0.0.120"
    ];
  };
}
