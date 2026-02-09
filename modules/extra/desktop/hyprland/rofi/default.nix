{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    rofi
  ];

  home-manager.users.axiom = {
    programs.rofi = {
      enable = true;
      theme = ./theme.rasi;
      extraConfig = {
        "show-icons" = true;
      };
    };
  };
}
