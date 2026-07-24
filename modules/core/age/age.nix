{
  lib,
  pkgs,
  config,
  ...
}:
{

  age.rekey = {
    masterIdentities = [ ./a.pub ];
    storageMode = "derivation";
    #storageMode = "local";
    #localStorageDir = ./. + "/secrets/rekeyed/${config.networking.hostName}";
    cacheDir = "/tmp/agenix-rekey/1000";
  };

  nix.settings.trusted-users = [ config.system.PrimaryUser ];
  nix.settings.extra-sandbox-paths = [ "/tmp/agenix-rekey/1000" ];

  systemd.tmpfiles.rules = [
    "d /tmp/agenix-rekey 1777 root root"
    "d /tmp/agenix-rekey/1000 1770 ${config.system.PrimaryUser} ${config.system.PrimaryUser}"
  ];

  age.ageBin = "PATH=$PATH:${lib.makeBinPath [ pkgs.age-plugin-yubikey ]} ${pkgs.age}/bin/age";

}
