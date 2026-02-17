{ inputs, ... }:

{

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    extraSetFlags = ["--netfilter-mode=nodivert"];
    extraDaemonFlags = ["--no-logs-no-support"];
  };


  #networking.firewall.checkReversePath = "loose";
}
