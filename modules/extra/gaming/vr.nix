{ pkgs, config, ... }:

{

  programs.steam = let
    patchedBwrap = pkgs.bubblewrap.overrideAttrs (o: {
      patches = (o.patches or []) ++ [
        ./bwrap.patch
      ];
    });
  in {
    enable = true;
    package = pkgs.steam.override {
      buildFHSEnv = (args: ((pkgs.buildFHSEnv.override {
        bubblewrap = patchedBwrap;
      }) (args // {
        extraBwrapArgs = (args.extraBwrapArgs or []) ++ [ "--cap-add ALL" ];
      })));
    };
  };

  
  boot = {
    kernelPatches = [
      {
        name = "amdgpu-ignore-ctx-privileges";
        patch = pkgs.fetchpatch {
          name = "cap_sys_nice_begone.patch";
          url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
          hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
        };
      }
    ];
    extraModprobeConfig = ''
      options cfg80211 ieee80211_regdom=US
    '';
  };
  networking.networkmanager.enable = true;
  environment.systemPackages = [ pkgs.iw ];
  users.users."${config.system.PrimaryUser}".extraGroups = [ "networkmanager" ];

}
