{
  config,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Aries = {
    id = "IQSEQKD-3GNY7VT-4GQEWEM-XK247KD-WSDGWKV-LL7JB6O-OGE3Y7X-FEUYOQC";
  };
}
