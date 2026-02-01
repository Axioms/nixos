{ inputs, pkgs, ... }:

{
  nix.settings = {
    download-buffer-size = 524288000; # 500 MiB
  };
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ../../modules/core
    ../../modules/extra/browsers/zen.nix
    ../../modules/extra/desktop/apps.nix
    ../../modules/extra/desktop/sddm.nix
    ../../modules/extra/desktop/hyprland
    ../../modules/extra/desktop/plasma
    ../../modules/extra/desktop
    ../../modules/extra/kitty
    ../../modules/extra/smartcard.nix
    ../../modules/extra/development.nix
    ../../modules/kernel/hardened.nix
    ../../users/axiom
    ../../modules/extra/docker.nix
    ../../modules/extra/bluetooth.nix
    ../../modules/extra/minecraft.nix
    ../../modules/extra/thunderbird
    ../../modules/extra/steam.nix
    ../../modules/extra/fingerprint.nix
    ../../modules/extra/plymouth.nix
    inputs.mineral.nixosModules.nix-mineral
  ];

  networking.hostName = "Aries"; # Define your hostname.
  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (
          subject.isInGroup("users")
            && (
              action.id == "org.freedesktop.login1.reboot" ||
              action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
              action.id == "org.freedesktop.login1.power-off" ||
              action.id == "org.freedesktop.login1.power-off-multiple-sessions"
            )
          )
        {
          return polkit.Result.YES;
        }
      });
    '';
  };
  nix-mineral = {
    enable = true;
  };

  age.rekey = {
    hostPubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC40CvgW64A29uY/74n8vvF4imHcPQ6RLq3mBIMfY24ovF3pDsViqakth4pvtanqAhUPSeQeyzLchvjtmzPh67asTgIxjg4HK7auey9H3HJFc7ctYUMwn8G2A3SgdJZl9qyF95mwuUWc3Fm1iDDoIATnf+DpkfBXMnNkzCfOEtQ0LdszNde7pfwZZwfRNguIG2VGFRyXZEyjRSYDwdUDxRyp+9LNhJ6enNdqgtqlREoUR4PTp4OQ/2mao91RY3aq1WuenDYnPirxEK2mpAlCa6NhnwVBBbVTvm/BXCxbHPLi/gZvWKvBb6mn3hRD84XiYmX0Jvc0fKHHfOm9OXfkrxTMUna0dpJnRs1D5g0i6w2KlFd8YeQorKA9Vb/TDHfPGvW8AGX/4QQQRkdKB5HGNhF3vbQngyX9thjnrxqYgi14jrpBOXx6ZLD+aafPLKnllLSRBApsoNqsuIOi1tWN+GvsYdraAuqVYceHbWRLFE2uEhmZVdU43ctXayudiWwRVgpuhYxfV3B9bBnLJWzRTYjP27DKSTa3fUatyIU1VmikZJZtl04d0pHt1dJ/XEPnNvl1OlGHorhOO3M+PfBR3RJnLOVZa1f+iWKMQMyX7w+76K8Gvm+f3nzE3qmTccsSNdNYhKu2r0Xsi0PAX1efXXAzwacXY34nJCNLkCF6ItdPQ== root@nixos";
  };

  hyprland.settings.monitor = ''
    monitor=, preferred, auto, 1
  '';

  hyprland.settings.autostart = [
    "dbus-update-activation-environment --all"
    "rm -rf ~/.config/chromium"
    "rm -rf ~/.cache/chromium"
    "${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init & kwalletd6 & kded5 & ${pkgs.unstable.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1 & nm-applet &   # Start KWallet"
    "${pkgs.bash}/bin/bash -c 'while ! dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep org.kde.StatusNotifierWatcher; do sleep 0.1; done'   # Fix for waybar tray not working"
    "XDG_MENU_PREFIX=arch- kbuildsycoca6   # Stupid Dolphin Open With being empty fix"
    "waybar & "
    "${pkgs.dunst}/bin/dunst -config ${../../modules/extra/desktop/hyprland/dunst/dunstrc} &"
    "hyprpaper &"
    "wl-paste --type text --watch cliphist store &"
    "wl-paste --type image --watch cliphist store &"
    "hypridle & "
    "nm-applet & "
    "blueman-tray & "
    "${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnectd &"
    "systemctl --user import-environment"
    "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user restart xdg-desktop-portal-hyprland.service"
    "systemctl --user restart xdg-desktop-portal-wlr"
    "${pkgs.bash}/bin/bash -c 'sleep 3; systemctl --user start hyprpaper-wallpaper.service'"
    "${pkgs.bash}/bin/bash -c 'sleep 4; systemctl --user start wallpaper.timer'"
    "${pkgs.thunderbird-latest}/bin/thunderbird"
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
