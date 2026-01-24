{
  config,
  ...
}:

{
  home-manager.users."${config.syncthing.username}".services.syncthing.settings.devices.Libra = {
    id = "6S3FGWA-CF44VRL-D2PCKKP-ZNBLDOH-MKYRYNS-UTCBTMN-NGDIAYZ-G3ACFAX";
    addresses = [
      "tcp://10.0.0.106"
    ];
  };
}
