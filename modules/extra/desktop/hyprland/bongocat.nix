_:

{
  programs.wayland-bongocat = {
    enable = true;
    autostart = false;
    # Example minimal configuration
    catXOffset = 100;
    catYOffset = -12;
    catAlign = "center";
    catHeight = 58;
    overlayHeight = 80;
    overlayOpacity = 0;
    overlayPosition = "top";
    layer = "top";
    fps = 60;
    enableAntialiasing = true;
    keypressDuration = 200;
    enableDebug = false;

    # add devices found with find-devices
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
      "/dev/input/event23"
    ];

    extraConfig = ''
      animation_name = bongocat
    '';
  };
}
