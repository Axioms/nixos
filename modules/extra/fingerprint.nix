{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ... other packages
    fprintd
    pam-fprintd # Ensure this is present
  ];

  services.fprintd.enable = true;
}
