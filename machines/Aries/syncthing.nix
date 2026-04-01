{
  config,
  inputs,
  ...
}:

{

  imports = [
    ../../modules/extra/syncthing/devices/Acquarius.nix
    ../../modules/extra/syncthing
    ../../modules/extra/syncthing/devices/Aries.nix
    ../../modules/extra/syncthing/devices/Boox.nix
    ../../modules/extra/syncthing/devices/Capricorn.nix
    ../../modules/extra/syncthing/devices/Libra.nix
    ../../modules/extra/syncthing/devices/Pisces.nix
    ../../modules/extra/syncthing/devices/Sagittarius.nix
    ../../modules/extra/syncthing/devices/Virgo.nix
    ../../modules/extra/syncthing/folders/Downloads.nix
    ../../modules/extra/syncthing/folders/Pictures.nix
  ];

  syncthing.username = "axiom";

  age.secrets.syncthing-Aries-key = {
    owner = "axiom";
    rekeyFile = "${inputs.secrets}/Aries/syncthing/key.pem.age";

  };
  age.secrets.syncthing-Aries-cert = {
    owner = "axiom";
    rekeyFile = "${inputs.secrets}/Aries/syncthing/cert.pem.age";
  };

  home-manager.users."axiom".services.syncthing = {
    enable = true;

    cert = config.age.secrets.syncthing-Aries-cert.path;
    key = config.age.secrets.syncthing-Aries-key.path;
  };
}
