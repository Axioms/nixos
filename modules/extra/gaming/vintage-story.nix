{ pkgs, config, ... }:

{
  home-manager.users."${config.system.PrimaryUser}" =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.vintagestoryPackages.latest ];

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
