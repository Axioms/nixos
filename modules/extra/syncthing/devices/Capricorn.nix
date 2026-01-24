{
  config,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Capricorn = {
    id = "EE2MM3X-AICLM27-4SQSATV-UGI7CN7-SIAJZNF-4CYXRU2-42TDA54-KFQMLAD";
  };
}
