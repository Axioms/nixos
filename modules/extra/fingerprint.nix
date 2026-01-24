{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ... other packages
    fprintd
    fprintd-tod # Ensure this is present
  ];

  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = true;
}
