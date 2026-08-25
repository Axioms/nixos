{ config, ... }:

{
  home-manager.users."${config.system.PrimaryUser}" =
    { ... }:
    {
      programs.zed-editor = {
        enable = true;
        enableMcpIntegration = false;
        mutableUserDebug = true;
        mutableUserTasks = true;
        mutableUserSettings = true;
        mutableUserKeymaps = true;
      };
    };
}
