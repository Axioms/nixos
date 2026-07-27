{ config, ... }:

{

  home-manager.users."${config.system.PrimaryUser}".imports = [ ./hm-module.nix ];
}
