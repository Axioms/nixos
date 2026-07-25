{
  config,
  lib,
  inputs,
  ...
}:

{
  services.alloy = {
    enable = true;
    configPath = builtins.toFile "config.alloy" (
      builtins.replaceStrings [ "PASSWORDFILE" ] [ "${config.age.secrets.alloy-service-key.path}" ] (
        builtins.readFile ./config.alloy
      )
    );
  };

  age.secrets.alloy-service-key = {
    owner = "alloy";
    mode = "400";
    rekeyFile = "${inputs.secrets}/Alloy/ServicePassword.txt.age";
  };

  users.extraGroups.docker.members = [ "alloy" ];
}
