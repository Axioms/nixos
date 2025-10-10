{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  programs.kdeconnect.enable = true;
  home-manager.users.axiom.services.kdeconnect.enable = true;
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  home.file."app-org.kde.xwaylandvideobridge@autostart.service" = {
    enable = true;
    executable = true;
    text = "
        [Install]
        WantedBy=default.target

        [Service]
        ExecStart=echo 1
        Type=oneshot

        [Unit]
        Description=hyprpaper
      ";
    target = ".config/systemd/user/app-org.kde.xwaylandvideobridge@autostart.service";
  };

  imports = [
    ./xdg.nix
  ];
}
