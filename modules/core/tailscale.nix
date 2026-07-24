{
  pkgs,
  config,
  lib,
  ...
}:

{
  options = {
    tailscale = {
      extraSetFlags = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.str;
      };
      extraDaemonFlags = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.str;
      };
    };
  };
  config = {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
      extraSetFlags = [ "--netfilter-mode=nodivert" ] ++ config.tailscale.extraSetFlags;
      extraDaemonFlags = [ "--no-logs-no-support" ] ++ config.tailscale.extraDaemonFlags;
    };

    environment.systemPackages = with pkgs; [
      tail-tray
      trayscale
    ];

    #networking.firewall.checkReversePath = "loose";
  };
}
