{
  pkgs,
  ...
}:

{

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  imports = [
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix

    ./waybar
    ./tofi
    ./dunst
    ./wlogout
  ];

  environment.systemPackages =
    let
      # I wish there was a `pkgs.mapLink` or something to do this
      application-menu = pkgs.runCommandLocal "xdg-application-menu" { } ''
        mkdir -p $out/etc/xdg/menus/
        ln -s ${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu $out/etc/xdg/menus/applications.menu
      '';
    in
    [
      application-menu
    ];

}
