{
  config,
  lib,
  inputs,
  ...
}:

{
  options = {
    alloy.settings.prometheusDomain = lib.mkOption {
      type = lib.types.str;
    };
    alloy.settings.lokiDomain = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = {

    services.alloy = {
      enable = true;
      configPath = builtins.toFile "config.alloy" (
        builtins.replaceStrings
          [ "PASSWORDFILE" "PROMETHEUSDOMAIN" "LOKIDOMAIN" ]
          [
            "${config.age.secrets.alloy-service-key.path}"
            "${config.alloy.settings.prometheusDomain}"
            "${config.alloy.settings.lokiDomain}"
          ]
          (builtins.readFile ./config.alloy)
      );
    };

    age.secrets.alloy-service-key = {
      group = "docker";
      mode = "440";
      rekeyFile = "${inputs.secrets}/Alloy/ServicePassword.txt.age";
    };

    users.extraGroups.docker.members = [ "alloy" ];
  };
}
