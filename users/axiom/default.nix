{
  config,
  pkgs,
  inputs,
  ...
}:

{

  programs.zsh.enable = true;

  users.groups.libvirtd.members = [ "axiom" ];

  users.groups.axiom = {
    members = [ "axiom" ];
    name = "axiom";
    gid = 1000;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.axiom = {
    isNormalUser = true;

    shell = pkgs.zsh;
    description = "axiom";
    group = "axiom";
    extraGroups = [
      "audio"
      "docker"
      "libvirt"
      "libvirt-qemu"
      "kvm"
      "qemu"
      "wheel"
      "networkmanager"
      "tty"
      "usbmux"
      "sshuser"
    ];
  };

  home-manager.users.axiom =
    { pkgs, imports, ... }:
    {
      programs.zsh.enable = true;
      services.syncthing = {
        enable = true;
      };

      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = [ "qemu:///system" ];
          uris = [ "qemu:///system" ];
        };
      };
      programs.home-manager.enable = true;
      #programs.bash.enable = true;
      # The state version is required and should stay at the version you
      # originally installed.
      home.stateVersion = "24.11";
    };
}
