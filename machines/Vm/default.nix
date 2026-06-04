# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/extra/browsers/firefox.nix
    ../../modules/extra/browsers/zen.nix
    ../../modules/extra/desktop/apps.nix
    ../../modules/extra/desktop/sddm.nix
    ../../modules/extra/desktop/hyprland
    ../../modules/extra/desktop/plasma
    ../../modules/extra/thunderbird
    ../../modules/extra/desktop
    ../../modules/extra/kitty
    ../../modules/extra/development.nix
    ../../modules/kernel/zen.nix
    ../../users/axiom
  ];

  # Qemu guest shit
  #services = {
  #  qemuGuest.enable = true;
  #  spice-vdagentd.enable = true; # enable copy and paste between host and guest
  #};
  hyprland.settings = {
    monitor = ''
      hl.monitor({output = "Virtual-1", mode = "1920x1080@60", position = "0x0", scale = "1"})
    '';
    enableDefaultWallPaper = true;
    autostart = [
      "dbus-update-activation-environment --all"
      "rm -rf ~/.config/chromium"
      "rm -rf ~/.cache/chromium"
      "${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init & kwalletd6 & kded5 & (${pkgs.unstable.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1 || ${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent) & nm-applet &" # Start KWallet
      "${pkgs.bash}/bin/bash -c 'while ! dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep org.kde.StatusNotifierWatcher; do sleep 0.1; done'" # Fix for waybar tray not working
      "XDG_MENU_PREFIX=arch- kbuildsycoca6" # Stupid Dolphin Open With being empty fix
      "waybar & "
      "${pkgs.dunst}/bin/dunst -config ${../../modules/extra/desktop/hyprland/dunst/dunstrc} &"
      "wl-paste --type text --watch cliphist store &"
      "wl-paste --type image --watch cliphist store &"
      "hypridle & "
      "nm-applet & "
      "blueman-tray & "
      "${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnectd &"
      "systemctl --user import-environment"
      "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "${pkgs.thunderbird-latest}/bin/thunderbird"
      "systemctl --user restart xdg-desktop-portal-hyprland.service"
      "systemctl --user restart xdg-desktop-portal-wlr"
      "tail-tray &"
    ];
  };
  networking.hostName = "vm"; # Define your hostname.
  users.users.axiom.initialPassword = "test";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
