{ inputs, config, ... }:

{
  home-manager.users."${config.system.PrimaryUser}" =
    { config, ... }:
    {

      imports = [
        inputs.bongocat.homeModule.default
      ];

      programs.wayland-bongocat = {
        enable = true;
        autostart = true;

        catXOffset = 100;
        catYOffset = -12;
        catHeight = 58;
        catAlign = "center";

        # Visual settings
        mirrorX = false;
        mirrorY = false;
        enableAntialiasing = true;

        # Overlay settings
        overlayPosition = "top";
        overlayHeight = 80;
        overlayOpacity = 0;
        layer = "top";

        # Animation settings
        idleFrame = 0;
        keypressDuration = 200;
        testAnimationDuration = 200;
        testAnimationInterval = 0;
        fps = 60;
        enableHandMapping = true;

        # Sleep mode
        idleSleepTimeout = 0;
        enableScheduledSleep = true;
        sleepBegin = "22:00";
        sleepEnd = "06:00";

        # Debug mode
        enableDebug = false;

        # Input devices
        inputDevices = [
          "/dev/input/event0"
          "/dev/input/event1"
          "/dev/input/event2"
          "/dev/input/event3"
          "/dev/input/event4"
          "/dev/input/event5"
          "/dev/input/event6"
          "/dev/input/event7"
          "/dev/input/event8"
          "/dev/input/event9"
          "/dev/input/event10"
          "/dev/input/event11"
          "/dev/input/event12"
          "/dev/input/event13"
          "/dev/input/event14"
          "/dev/input/event15"
          "/dev/input/event16"
          "/dev/input/event18"
          "/dev/input/event19"
          "/dev/input/event20"
          "/dev/input/event21"
          "/dev/input/event22"
          "/dev/input/event23"
          "/dev/input/event24"
          "/dev/input/event25"
          "/dev/input/event26"
          "/dev/input/event28"
          "/dev/input/event29"
          "/dev/input/event30"
          "/dev/input/event31"
          "/dev/input/event32"
          "/dev/input/event33"
          "/dev/input/event34"
          "/dev/input/event35"
          "/dev/input/event36"
          "/dev/input/event37"
          "/dev/input/event38"
          "/dev/input/event39"
          "/dev/input/event40"
          "/dev/input/event41"
          "/dev/input/event42"
          "/dev/input/event43"
          "/dev/input/event44"
          "/dev/input/event45"
          "/dev/input/event46"
          "/dev/input/event47"
          "/dev/input/event48"
          "/dev/input/event49"
          "/dev/input/event50"
          "/dev/input/event260"
        ];
      };
    };
}
