# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }:
{
  nix.settings = {
    download-buffer-size = 524288000; # 500 MiB
  };

  imports = [
    ./hardware.nix
    ./syncthing.nix
    ../../modules/core
    ../../modules/extra/browsers/firefox.nix
    ../../modules/extra/browsers/zen.nix
    ../../modules/extra/desktop/apps.nix
    ../../modules/extra/desktop/sddm.nix
    ../../modules/extra/desktop/hyprland
    ../../modules/extra/desktop/plasma
    ../../modules/extra/desktop
    ../../modules/extra/kitty
    ../../modules/extra/smartcard.nix
    ../../modules/extra/development.nix
    ../../modules/extra/libvirt
    ../../modules/kernel/cachy.nix
    ../../users/axiom
    ../../modules/core/network-bridge.nix
    ../../modules/extra/docker.nix
    ../../modules/extra/bluetooth.nix
    ../../modules/extra/steam.nix
    ../../modules/extra/minecraft.nix
    ../../modules/extra/thunderbird
    ../../modules/extra/keyboard.nix
    #inputs.ucodenix.nixosModules.default
  ];
  syncthing.username = "axiom";
  security.polkit.enable = true;

  security.polkit.extraConfig = ''
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

  age.rekey = {
    hostPubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyMVFEoo4mdabDl87ZG+6lvNf04YKmoFPNTbtu6hXZPOs9GNLPMvoYJjSmlI4yh1xSk1DxGGtYFvBHFyvdpqwruHJeYVDqQNvrW0OjorU6eTKMmljv02dUf71rXyF8z2MZJYNT2QqOm+t5C5kj8k73sZXPDA3bE7HxKS2043CcS2MkHVZJcLLO8+S0cLMTv7dWgRRru+yX5Hg3XUAMLBI3ABav90M7QFm4OvsMGudT5qrzbUC+cyADkii0o0DOpzZEG/dECwtwhbPoP3leWThqz/FMwmbmK4fxyJ2NJRAbL1X07l4OnLOlyzyiRgA/pSNJzRWzv95nB5V1PhVdn7lUGKS3CeLjawZdP8vECH2zLHqoJNrcDwLUzE0ZM3vcJd7ene/7SNgUyttAWdXlv8FlzLR3fIWlRuiQz2f4TANjI45PjR80aRriUqASZubyFERAt/JM4jZSYr2jzEmIWCjWZ04QaI632qSgUkzfVSLcSdUgfvqMvTkTAK72Gmu51Ts= root@Virgo";
  };

  networking = {
    firewall.enable = false;
    interfaces.enp12s0.wakeOnLan = {
      policy = [ "magic" ];
      enable = true;
    };

    hostName = "Virgo"; # Define your hostname.
  };

  network-module.bridge.devices = [ "enp12s0" ];

  hyprland.settings.monitor = ''
    monitor=DP-2, 1920x1080,0x0, 1
    monitor=DP-3, 3840x2160@120.00Hz, 1920x0, 1
    monitor=HDMI-A-1, 3840x2160@60.00Hz, 5760x0, 1
  '';

  hyprland.settings.autostart = [
    "dbus-update-activation-environment --all"
    "rm -rf ~/.config/chromium"
    "rm -rf ~/.cache/chromium"
    "${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init & kwalletd6 & kded5 & ${pkgs.unstable.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1 & nm-applet &   # Start KWallet"
    "${pkgs.bash}/bin/bash -c 'while ! dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep org.kde.StatusNotifierWatcher; do sleep 0.1; done'   # Fix for waybar tray not working"
    "XDG_MENU_PREFIX=arch- kbuildsycoca6   # Stupid Dolphin Open With being empty fix"
    "waybar & "
    "steam -silent & "
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
    "${pkgs.bash}/bin/bash -c 'sleep 2.5 ; nextcloud &'"
    "systemctl --user restart xdg-desktop-portal-hyprland.service"
    "systemctl --user restart xdg-desktop-portal-wlr"
    "${pkgs.bash}/bin/bash -c 'sleep 3; systemctl --user start hyprpaper-wallpaper.service'"
    "${pkgs.bash}/bin/bash -c 'sleep 4; systemctl --user start wallpaper.timer'"
    "ddcutil --display 1 setvcp 10 100"
    "ddcutil --display 2 setvcp 10 100"
    "ddcutil --display 3 setvcp 10 100"
    "${pkgs.thunderbird-latest}/bin/thunderbird"
  ];

  #services.ucodenix.enable = true;
  #services.ucodenix.cpuModelId = "00A10F10";
  #hardware.cpu.amd.updateMicrocode = true;
  system.stateVersion = "25.05"; # Did you read the comment?
}
