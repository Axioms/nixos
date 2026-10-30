{ pkgs, config, ... }:

{

  #disabledModules = [ "services/desktops/pipewire/pipewire.nix" ];
  #imports = [
  #  "${inputs.nixpkgs-unstable}/nixos/modules/services/desktops/pipewire/pipewire.nix"
  #];

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig = {
      pipewire = {
        "98-crackling-fix" = {
          "context.properties" = {
            "default.clock.quantum" = 1024;
            "default.clock.min-quantum" = 1024;
            "default.clock.max-quantum" = 8192;
          };
        };
      };

      pipewire-pulse."92-low-latency" = {
        context.modules = [
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              pulse = {
                min = {
                  req = "32/48000";
                  quantum = "32/48000";
                };
                default.req = "32/48000";
                max = {
                  req = "32/48000";
                  quantum = "32/48000";
                };
              };
            };
          }
        ];
        stream.properties = {
          node.latency = "32/48000";
          resample.quality = 1;
        };
      };
    };
    wireplumber = {
      enable = true;
      extraConfig = {
        "disable-suspend" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                {
                  "node.name" = "~alsa_output.*";
                }
              ];
              actions = {
                update-props = {
                  "session.suspend-timeout-seconds" = 0;
                };
              };
            }
          ];
        };

        "99-crackling-fix" = {
          "api.alsa.period-size" = 1024;
          "api.alsa.headroom" = 8192;
        };
      };
    };
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  home-manager.users."${config.system.PrimaryUser}" = {
    services.pipewire.configs = [
      {

        context.objects = [
          {
            "factory" = "adapter";
            "args" = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "game_sink";
              "node.description" = "Game Sink";
              "media.class" = Audio/Sink;
              "audio.position" = [
                "FL"
                "FR"
              ];
              "monitor.channel-volumes" = true;
              "capture.props" = {
                "media.role" = "Game";
              };
            };
          }
        ];
      }
    ];
  };

  environment.systemPackages = [ pkgs.pulseaudio ];
}
