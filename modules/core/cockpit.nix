{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btrfs-progs
    cockpit
    #pkgs.lib.overrideDerivation
    #    (pkgs.udisks2)
    #    (old: { configFlags = "--enable-modules"; })
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
      "https://virgo.local.axioms.dev"
    ];
  };
  systemd.tmpfiles.rules = [
    "f /usr/share/dbus-1/system.d/org.freedesktop.UDisks2.conf 0644 root root - -"
    "f /usr/share/dbus-1/system.d/org.freedesktop.NetworkManager.conf 0644 root root - -"
  ];
}
