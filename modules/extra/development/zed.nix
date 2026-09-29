{
  config,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users."${config.system.PrimaryUser}" = _: {
    programs.zed-editor = {
      enable = true;
      enableMcpIntegration = false;
      mutableUserDebug = true;
      mutableUserTasks = true;
      mutableUserSettings = true;
      mutableUserKeymaps = true;
      package = pkgs.zed-editor;
      extraPackages = with pkgs; [
        rust-bin.stable.latest.default
        rust-bin.stable.latest.rust-src
      ];
    };
  };

  environment.shellAliases = {
    zed = "${lib.getExe pkgs.zed-editor}";
  };
}
