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
        autostart = false;
      };

      home.file."bongocat.conf" = {
        enable = true;
        executable = true;
        text = ''
          # Cat position and size
          cat_x_offset=100
          cat_y_offset=-12
          cat_height=58
          cat_align=center

          # Visual settings
          mirror_x=0
          mirror_y=0
          enable_antialiasing=1

          # Overlay settings
          overlay_position=top
          overlay_height=80
          overlay_opacity=0
          layer=top

          # Animation settings
          idle_frame=0
          keypress_duration=200
          test_animation_duration=200
          test_animation_interval=0
          fps=60
          enable_hand_mapping=1

          # Sleep mode
          idle_sleep_timeout=0
          enable_scheduled_sleep=0
          sleep_begin=22:00
          sleep_end=06:00

          # Debug mode
          enable_debug=0

          # Monitor
          monitor=

          # Input devices
          keyboard_device=/dev/input/event0
          keyboard_device=/dev/input/event1
          keyboard_device=/dev/input/event2
          keyboard_device=/dev/input/event3
          keyboard_device=/dev/input/event4
          keyboard_device=/dev/input/event5
          keyboard_device=/dev/input/event6
          keyboard_device=/dev/input/event7
          keyboard_device=/dev/input/event8
          keyboard_device=/dev/input/event9
          keyboard_device=/dev/input/event10
          keyboard_device=/dev/input/event11
          keyboard_device=/dev/input/event12
          keyboard_device=/dev/input/event13
          keyboard_device=/dev/input/event14
          keyboard_device=/dev/input/event15
          keyboard_device=/dev/input/event23

          hotplug_scan_interval=30

          # Extra Config
          animation_name = bongocat'';
        target = ".config/bongocat/bongocat.conf";
      };

    };
}
