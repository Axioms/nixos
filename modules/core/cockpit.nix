{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    cockpit.origins = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };

  config = {

    environment.systemPackages = with pkgs; [
      btrfs-progs
      cockpit
      udisks2
      networkmanager
    ];
    services.cockpit = {
      enable = true;
      openFirewall = true;
      port = 9090;
      allowed-origins = [
        "http://localhost:9090"
        "https://localhost:9090"
      ]
      ++ config.cockpit.origins;
    };
    systemd.tmpfiles.rules = [
      "f /usr/share/dbus-1/system.d/org.freedesktop.UDisks2.conf 0644 root root - -"
      "f /usr/share/dbus-1/system.d/org.freedesktop.NetworkManager.conf 0644 root root - -"
    ];
  };
}
