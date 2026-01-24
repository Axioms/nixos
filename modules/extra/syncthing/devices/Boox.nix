{
  config,
  ...
}:

{

  home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Boox = {
    id = "FZ4MKVT-CNT6EQ6-2URASAO-OIHO6JG-O2QJN5V-3QGPGPB-UG4DFII-NH4RHAI";
  };
}
