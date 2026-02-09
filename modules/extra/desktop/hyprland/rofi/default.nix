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
      theme = builtins.readFile ./theme.rasi;
    };
  };
}
