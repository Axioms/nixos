{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ... other packages
    fprintd
    pam-fprintd # Ensure this is present
  ];

  services.fprintd.enable = true;

  services.xserver.displayManager.sddm.extraConfig = ''
  # Include the default SDDM PAM configuration
  @include /etc/pam.d/sddm

  # Add the fingerprint authentication module for login
  auth        sufficient    pam_fprintd.so
'';
}
