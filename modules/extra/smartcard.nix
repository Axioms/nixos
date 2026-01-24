{ pkgs, ... }:

{
  # smart card
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    yubico-pam
    yubico-piv-tool
    yubihsm-shell
    yubioath-flutter
    #yubikey-manager-qt
    #yubikey-personalization-gui
    yubikey-touch-detector
  ];
}
