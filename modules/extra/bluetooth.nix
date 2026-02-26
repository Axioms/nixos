{ pkgs, ... }:

{

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      package = pkgs.bluez-experimental;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Privacy = "device";
          JustWorksRepairing = "always";
          Experimental = true;
          #Class = "0x000100";
          ControllerMode = "bredr";
          # Shows battery charge of connected devices on supported
          # Bluetooth adapters. Defaults to 'false'.
          #Experimental = true;
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
    };
    xpadneo.enable = true;
    xone.enable = true;
    enableAllFirmware = true;
  };
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    blueman
  ];

  boot.extraModprobeConfig = "options bluetooth disable_ertm=1 ";

}
