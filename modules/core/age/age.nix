{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{

  age.rekey = {
    hostPubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7zkWOzJ99fBDXFgasY3p4zImGms7J26og/xQ4YjfXR6ZPqM+ZPVtZUMhg3LsE8CiR0x5PP2ASY+EL5cBsWQhfTVD18xj+o7gVhD1jrEJ/DYjtbkYbwnU40p5yZaLqJsjF5BuWDch7P8NKat1eAKBFGCiVWoPIYrwoyL+jH3yWUAIrxfk0xbDEyaf12trof9zJW9UN4hWwbL1sdLs8jZZ2Q8xd2A8swPzZ7jYrRSG/KNMbgYBhxZdYatPLN8qPlOSTLMWNiqyCl9Tsv35NjhdMBAbq8jZdfcXPHcXXXna3YK0QUMyTIR0MYUXCSTnD8u98juTfhw47UZ0VhuCzAxS/vyvhijSitVaVX1LSrHB7t0zoplsAPCJ2SFxYbp3g6iHa53fcbFAfX/WQE+9nCsSS3VVJiCoUJfB6QCgUmmdr39U5IjwsO4dmEieyyJHNWtrnebIHi8VronItapsOUy7ezAfTQAVbo8dEnYEefh3NlawfB34zS3amjDhL2PsfFpiKocicBcnwWtQBys25Stpge20y5w/aYlW40HK4TERzFV+a6dXlGwTMzhX6uSV941k6oKpU+m7ikQ+QFLg74JGwmhePwAnDNQujU1FkaRQVcmPKI6pkVg5VJ8ISuszx7vcdG6mu/pgzAuo2mDfICaeaaSh9+vPVOp6TMHqzKLlUHQ== root@vm";
    masterIdentities = [ ./a.pub ];
    storageMode = "derivation";
    #localStorageDir = ./. + "/secrets/rekeyed/${config.networking.hostName}";
    cacheDir = "/tmp/agenix-rekey/1000";
  };

  nix.settings.trusted-users = [ "axiom" ];
  nix.settings.extra-sandbox-paths = [ "/tmp/agenix-rekey/1000" ];

  systemd.tmpfiles.rules = [
    "d /tmp/agenix-rekey 1777 root root"
  ];

  age.ageBin = "PATH=$PATH:${lib.makeBinPath [ pkgs.age-plugin-yubikey ]} ${pkgs.age}/bin/age";

  #age.secrets.root-pw-hash.rekeyFile = ./root-pw-hash.age;
  #users.users.root.hashedPasswordFile = config.age.secrets.root-pw-hash.path;

  #age.secrets.age-keys = {
  #  rekeyFile = ./secrets/randomPassword.age;
  #  generator.script = "passphrase";
  #};
}
