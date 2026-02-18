{ pkgs, ... }:

{

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    extraSetFlags = [ "--netfilter-mode=nodivert" ];
    extraDaemonFlags = [ "--no-logs-no-support" ];
  };

  environment.systemPackages = with pkgs; [
    tail-tray
    trayscale
  ];

  #networking.firewall.checkReversePath = "loose";
}
