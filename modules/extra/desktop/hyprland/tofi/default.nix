{
  pkgs,
  ...
}:

{

  # Optional; hint electron apps to use wayland=
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  home-manager.users.axiom = {
    home.file."configA" = {
      enable = true;
      source = ./configA;
      target = ".share/tofi/configA";
    };

    home.file."configV" = {
      enable = true;
      source = ./configV;
      target = ".share/tofi/configV";
    };
  };

  environment.systemPackages = with pkgs; [
    tofi
  ];

  #  home-manager.users.axiom = {
  #    programs.tofi = {
  #      enable = true;
  #      settings = {
  #        "width" = "100%";
  #        "height" = "100%";
  #        "border-width" = 0;
  #        "outline-width" = 0;
  #        "padding-left" = "33%";
  #        "padding-top" = "33%";
  #        "result-spacing" = 25;
  #        "num-results" = 5;
  #        "font" = "JetBrainsMono Nerd Font";
  #        "font-size" = 24;
  #        "text-color" = "#4e4e5f";
  #        "prompt-text" = " : ";
  #        "background-color" = "#11111bd9";
  #        "selection-color" = "#83A4E7";
  #      };
  #    };
  #  };
}
