{
  pkgs,
  lib,
  config,
  ...
}:
let
  patchedBwrap = pkgs.bubblewrap.overrideAttrs (o: {
    patches = (o.patches or [ ]) ++ [
      ./bwrap.patch
    ];
  });
in
{
  options = {
    steam.enable.vr = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = {
    programs = {
      gamescope = {
        enable = true;
        capSysNice = false;
      };
      steam = {
        enable = true;
        localNetworkGameTransfers.openFirewall = true;
        dedicatedServer.openFirewall = true;
        remotePlay.openFirewall = true;
        extest.enable = true;
        gamescopeSession.enable = true;
        protontricks.enable = true;
        package =
          if config.steam.enable.vr then
            pkgs.steam.override {
              buildFHSEnv =
                args:
                (
                  (pkgs.buildFHSEnv.override {
                    bubblewrap = patchedBwrap;
                  })
                    (
                      args
                      // {
                        extraBwrapArgs = (args.extraBwrapArgs or [ ]) ++ [ "--cap-add ALL" ];
                      }
                    )
                );
            }
          else
            pkgs.steam;

        extraPackages = with pkgs; [
          kdePackages.breeze-icons
          kdePackages.breeze
          gamescope
          steam-devices-udev-rules
          dualsensectl
          lsfg-vk
          lsfg-vk-ui
          gdk-pixbuf
        ];
      };
      appimage = {
        enable = true;
        binfmt = true;

      };
    };

    hardware.steam-hardware.enable = true;
    environment.systemPackages = with pkgs; [
      unstable.protonup-qt
      gamescope
      steam-devices-udev-rules
      dualsensectl
      lsfg-vk
      lsfg-vk-ui
    ];
    systemd.services.steam-setuid = lib.mkIf config.steam.enable.vr {
      enable = true;
      description = "steam set uid";
      unitConfig = {
        Type = "oneshot";
      };
      serviceConfig = {
        ExecStart = "setcap CAP_SYS_NICE+ep /home/${config.system.PrimaryUser}/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrcompositor-launcher";
      };
      wantedBy = [ "default.target" ];
    };

  };
}
