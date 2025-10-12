{
  config,
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    ../../modules/extra/syncthing/devices/Acquarius.nix
    ../../modules/extra/syncthing
    ../../modules/extra/syncthing/devices/Boox.nix
    ../../modules/extra/syncthing/devices/Capricorn.nix
    ../../modules/extra/syncthing/devices/Libra.nix
    ../../modules/extra/syncthing/devices/Pisces.nix
    ../../modules/extra/syncthing/devices/Sagittarius.nix
    ../../modules/extra/syncthing/devices/Virgo.nix
    ../../modules/extra/syncthing/folders/AndroidCamera.nix
    ../../modules/extra/syncthing/folders/Books.nix
    ../../modules/extra/syncthing/folders/Downloads.nix
    ../../modules/extra/syncthing/folders/Pictures.nix
    ../../modules/extra/syncthing/folders/School.nix
    ../../modules/extra/syncthing/folders/Music.nix
    ../../modules/extra/syncthing/folders/Library.nix
    ../../modules/extra/syncthing/folders/ISOs.nix
    ../../modules/extra/syncthing/folders/EmuDeck-Saves.nix
    ../../modules/extra/syncthing/folders/AndroidBackups.nix
  ];

  age.secrets.syncthing-Virgo-key = {
    owner = "axiom";
    rekeyFile = "${inputs.secrets}/Virgo/syncthing/key.pem.age";

  };
  age.secrets.syncthing-Virgo-cert = {
    owner = "axiom";
    rekeyFile = "${inputs.secrets}/Virgo/syncthing/cert.pem.age";
  };

  home-manager.users."axiom".services.syncthing = {
    enable = true;
    #settings = {
    #  device = {
    #    deviceID = config.age.secrets.syncthing-Virgo-id;
    #  };
    #};

    cert = config.age.secrets.syncthing-Virgo-cert.path;
    key = config.age.secrets.syncthing-Virgo-key.path;
  };
}
