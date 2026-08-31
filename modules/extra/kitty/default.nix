{ config, ... }:

{

  home-manager.users."${config.system.PrimaryUser}" =
    { pkgs, ... }:
    {
      programs.kitty = {
        enable = true;
        enableGitIntegration = true;
        shellIntegration = {
          enableZshIntegration = true;
          enableBashIntegration = true;
        };
        font = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
          size = 12;
        };

        settings = {
          window_padding_width = 0;
          italic_font = "auto";
          bold_italic_font = "auto";
          update_check_interval = 0;
          # --- Scrollback ---
          crollback_lines = 0;
          wheel_scroll_multiplier = 3;
          # --- Cursor ---
          cursor_shape = "underline";
          cursor_beam_thickness = 2.5;
          cursor_blink_interval = 0.5;
          # --- Bell ---
          enable_audio_bell = "no";
          visual_bell_duration = 0.2;
          # --- Tab Bar ---
          tab_bar_style = "powerline";
          tab_bar_min_tabs = 1;
          tab_powerline_style = "slanted";
          # --- Mouse ---
          underline_hyperlinks = "always";
          strip_trailing_spaces = "smart";
        };

        keybindings = {
          "ctrl+shift+g" = "show_last_command_output";
          "ctrl+shift+h" = "show_scrollback";
          "shift+cmd+w" = "close_os_window";
          "ctrl+shift+q" = "close_tab";
          "ctrl+shift+w" = "close_window";
          "ctrl+shift+c" = "copy_to_clipboard";
          "cmd+c" = "copy_or_noop";
          "ctrl+shift+f6" = "debug_config";
          "ctrl+shift+f2" = "edit_config_file";
          "ctrl+shift+8" = "eighth_window";
          "ctrl+shift+5" = "fifth_window";
          "ctrl+shift+1" = "first_window";
          "ctrl+shift+4" = "fourth_window";
          "cmd+h" = "hide_macos_app";
          "opt+cmd+h" = "hide_macos_other_apps";
          "cmd+m" = "minimize_macos_window";
          "ctrl+shift+," = "move_tab_backward";
          "ctrl+shift+." = "move_tab_forward";
          "ctrl+shift+b" = "move_window_backward";
          "ctrl+shift+f" = "move_window_forward";
          "ctrl+shift+`" = "move_window_to_top";
          "ctrl+shift+n" = "new_os_window";
          "ctrl+shift+t" = "new_tab";
          "ctrl+shift+enter" = "new_window";
          "ctrl+shift+l" = "next_layout";
          "ctrl+shift+right" = "next_tab";
          "ctrl+shift+]" = "next_window";
          "ctrl+shift+9" = "ninth_window";
          "ctrl+shift+escape" = "kitty_shell window";
          "ctrl+shift+o" = "pass_selection_to_program";
          "ctrl+shift+v" = "paste_from_clipboard";
          "ctrl+shift+s" = "paste_from_selection";
          "ctrl+shift+left" = "previous_tab";
          "ctrl+shift+[" = "previous_window";
          "cmd+q" = "quit";
          "ctrl+shift+down" = "scroll_line_down smooth";
          "ctrl+shift+up" = "scroll_line_up smooth";
          "ctrl+shift+page_down" = "scroll_page_down";
          "ctrl+shift+page_up" = "scroll_page_up";
          "ctrl+shift+end" = "scroll_end";
          "ctrl+shift+home" = "scroll_home";
          "ctrl+shift+/" = "search_scrollback";
          "ctrl+shift+2" = "second_window";
          "ctrl+shift+alt+h" = "send_text all Hello World";
          "ctrl+shift+alt+t" = "set_tab_title";
          "ctrl+shift+7" = "seventh_window";
          "ctrl+shift+6" = "sixth_window";
          "ctrl+shift+r" = "start_resizing_window";
          "ctrl+shift+0" = "tenth_window";
          "ctrl+shift+3" = "third_window";
          "ctrl+shift+f11" = "toggle_fullscreen";
          "opt+cmd+s" = "toggle_macos_secure_keyboard_entry";
          "ctrl+shift+f10" = "toggle_maximized";
          "ctrl+shift+f7" = "focus_visible_window";
          "ctrl+shift+f8" = "swap_with_window";
        };

        themeFile = "Catppuccin-Mocha";
      };
    };
}
