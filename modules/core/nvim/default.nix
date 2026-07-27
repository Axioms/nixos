{
  pkgs,
  config,
  ...
}:

{

  home-manager.users."${config.system.PrimaryUser}".imports = [ ./hm-module.nix ];

  # env.VIMINIT = "let \\$MYVIMRC='\\$XDG_CONFIG_HOME/nvim/init.lua' | source \\$MYVIMRC";

  environment.shellAliases = {
    nvim = "nvim -u ~/.config/nvim/init.lua";
    vim = "nvim -u ~/.config/nvim/init.lua";
    vi = "nvim -u ~/.config/nvim/init.lua";
    v = "nvim -u ~/.config/nvim/init.lua";
  };
}
