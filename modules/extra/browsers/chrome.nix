{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.ungoogled-chromium ];
}
