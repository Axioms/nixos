{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
    docker
  ];
  virtualisation.docker.enable = true;
  users.users."${config.system.PrimaryUser}".extraGroups = [ "docker" ];
}
