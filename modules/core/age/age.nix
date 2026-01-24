{
  lib,
  pkgs,
  ...
}:
{

  age.rekey = {
    #hostPubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyMVFEoo4mdabDl87ZG+6lvNf04YKmoFPNTbtu6hXZPOs9GNLPMvoYJjSmlI4yh1xSk1DxGGtYFvBHFyvdpqwruHJeYVDqQNvrW0OjorU6eTKMmljv02dUf71rXyF8z2MZJYNT2QqOm+t5C5kj8k73sZXPDA3bE7HxKS2043CcS2MkHVZJcLLO8+S0cLMTv7dWgRRru+yX5Hg3XUAMLBI3ABav90M7QFm4OvsMGudT5qrzbUC+cyADkii0o0DOpzZEG/dECwtwhbPoP3leWThqz/FMwmbmK4fxyJ2NJRAbL1X07l4OnLOlyzyiRgA/pSNJzRWzv95nB5V1PhVdn7lUGKS3CeLjawZdP8vECH2zLHqoJNrcDwLUzE0ZM3vcJd7ene/7SNgUyttAWdXlv8FlzLR3fIWlRuiQz2f4TANjI45PjR80aRriUqASZubyFERAt/JM4jZSYr2jzEmIWCjWZ04QaI632qSgUkzfVSLcSdUgfvqMvTkTAK72Gmu51Ts= root@Virgo";
    #hostPubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7zkWOzJ99fBDXFgasY3p4zImGms7J26og/xQ4YjfXR6ZPqM+ZPVtZUMhg3LsE8CiR0x5PP2ASY+EL5cBsWQhfTVD18xj+o7gVhD1jrEJ/DYjtbkYbwnU40p5yZaLqJsjF5BuWDch7P8NKat1eAKBFGCiVWoPIYrwoyL+jH3yWUAIrxfk0xbDEyaf12trof9zJW9UN4hWwbL1sdLs8jZZ2Q8xd2A8swPzZ7jYrRSG/KNMbgYBhxZdYatPLN8qPlOSTLMWNiqyCl9Tsv35NjhdMBAbq8jZdfcXPHcXXXna3YK0QUMyTIR0MYUXCSTnD8u98juTfhw47UZ0VhuCzAxS/vyvhijSitVaVX1LSrHB7t0zoplsAPCJ2SFxYbp3g6iHa53fcbFAfX/WQE+9nCsSS3VVJiCoUJfB6QCgUmmdr39U5IjwsO4dmEieyyJHNWtrnebIHi8VronItapsOUy7ezAfTQAVbo8dEnYEefh3NlawfB34zS3amjDhL2PsfFpiKocicBcnwWtQBys25Stpge20y5w/aYlW40HK4TERzFV+a6dXlGwTMzhX6uSV941k6oKpU+m7ikQ+QFLg74JGwmhePwAnDNQujU1FkaRQVcmPKI6pkVg5VJ8ISuszx7vcdG6mu/pgzAuo2mDfICaeaaSh9+vPVOp6TMHqzKLlUHQ== root@vm";
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

  #age.secrets.root-pw-hash.rekeyFile = ./root-pw-hash.age;
  #users.users.root.hashedPasswordFile = config.age.secrets.root-pw-hash.path;

  #age.secrets.age-keys = {
  #  rekeyFile = ./secrets/randomPassword.age;
  #  generator.script = "passphrase";
  #};
}
