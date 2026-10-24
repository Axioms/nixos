{
  pkgs,
  ...
}:

{
  virtualisation.waydroid = {
    enable = true;
  };

  enviroment.systemPackages = with pkgs; [
    waydroid-helper
    waydroid-nftables
  ];
}
