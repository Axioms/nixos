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
          keyboard_device=/dev/input/event16
          keyboard_device=/dev/input/event18
          keyboard_device=/dev/input/event19
          keyboard_device=/dev/input/event20
          keyboard_device=/dev/input/event21
          keyboard_device=/dev/input/event22
          keyboard_device=/dev/input/event23
          keyboard_device=/dev/input/event24
          keyboard_device=/dev/input/event25
          keyboard_device=/dev/input/event26
          keyboard_device=/dev/input/event28
          keyboard_device=/dev/input/event29
          keyboard_device=/dev/input/event30
          keyboard_device=/dev/input/event31
          keyboard_device=/dev/input/event32
          keyboard_device=/dev/input/event33
          keyboard_device=/dev/input/event34
          keyboard_device=/dev/input/event35
          keyboard_device=/dev/input/event36
          keyboard_device=/dev/input/event37
          keyboard_device=/dev/input/event38
          keyboard_device=/dev/input/event39
          keyboard_device=/dev/input/event40
          keyboard_device=/dev/input/event41
          keyboard_device=/dev/input/event42
          keyboard_device=/dev/input/event43
          keyboard_device=/dev/input/event44
          keyboard_device=/dev/input/event45
          keyboard_device=/dev/input/event46
          keyboard_device=/dev/input/event47
          keyboard_device=/dev/input/event48
          keyboard_device=/dev/input/event49
          keyboard_device=/dev/input/event50
          keyboard_device=/dev/input/event260

          hotplug_scan_interval=30

          # Extra Config
          animation_name = bongocat'';
        target = ".config/bongocat/bongocat.conf";
      };

    };
}
