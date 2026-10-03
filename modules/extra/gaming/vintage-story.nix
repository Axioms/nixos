{
  pkgs,
  config,
  inputs,
  ...
}:

{
  home-manager.users."${config.system.PrimaryUser}" = {
    imports = [ inputs.vintagestory.homeModules.default ];

    programs.vs-launcher = {
      enable = true;
      settings.gameVersions = with pkgs.vintagestoryPackages; [
        (latest.override {
          waylandSupport = true;
          x11Support = false; # optional
        })
      ];
    };
  };
}
