{
  lib,
  pkgs,
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

  nix.settings.trusted-users = [ "axiom" ];
  nix.settings.extra-sandbox-paths = [ "/tmp/agenix-rekey/1000" ];

  systemd.tmpfiles.rules = [
    "d /tmp/agenix-rekey 1777 root root"
  ];

  age.ageBin = "PATH=$PATH:${lib.makeBinPath [ pkgs.age-plugin-yubikey ]} ${pkgs.age}/bin/age";

}
