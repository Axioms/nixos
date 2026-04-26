{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fprintd
    fprintd-tod
  ];

  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = true;
}
