{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
    docker
  ];
  virtualisation.docker.enable = true;
  users.users.axiom.extraGroups = [ "docker" ];
}
