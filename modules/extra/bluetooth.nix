{ pkgs, ... }:

{

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez-experimental;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
    xpadneo.enable = true;
  };
  services.blueman.enable = true;

}
