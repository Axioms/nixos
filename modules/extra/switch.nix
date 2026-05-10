{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    ns-usbloader
    fusee-nano
  ];

  services.udev.enable = true;
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="3000", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0955", ATTRS{idProduct}=="7321", MODE="0666"
  '';
}
