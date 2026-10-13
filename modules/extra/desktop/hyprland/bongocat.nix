_:

{
  programs.wayland-bongocat = {
    enable = true;
    autostart = false;
    # Example minimal configuration
    cat_x_offset = 100;
    cat_y_offset = -12;
    cat_align = "center";
    cat_height = 58;
    overlay_height = 80;
    overlay_opacity = 0;
    overlay_position = "top";
    layer = "top";
    fps = 60;
    enable_antialiasing = 1;
    animation_name = "bongocat";
    keypress_duration = 200;

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
  };
}
