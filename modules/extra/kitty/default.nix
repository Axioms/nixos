{
  config,
  pkgs,
  inputs,
  ...
}:

{

  home-manager.users.axiom =
    { pkgs, ... }:
    {
      programs.kitty = {
        enable = true;
        font = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
          size = 12;
        };

        settings = {
          window_padding_width = 0;
          italic_font = "auto";
          bold_italic_font = "auto";
          scrollback_lines = 10000;
          enable_audio_bell = false;
          update_check_interval = 0;
        };

        themeFile = "Catppuccin-Mocha";
      };
    };
}
