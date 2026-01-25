{ inputs, ... }:

{
  nix.settings = {
    download-buffer-size = 524288000; # 500 MiB
  };
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ../../modules/core
    ../../modules/extra/browsers/zen.nix
    ../../modules/extra/desktop/apps.nix
    ../../modules/extra/desktop/sddm.nix
    ../../modules/extra/desktop/hyprland
    ../../modules/extra/desktop/plasma
    ../../modules/extra/desktop
    ../../modules/extra/kitty
    ../../modules/extra/smartcard.nix
    ../../modules/extra/development.nix
    ../../modules/kernel/normal.nix
    ../../users/axiom
    ../../modules/extra/docker.nix
    ../../modules/extra/minecraft.nix
    ../../modules/extra/thunderbird
    ../../modules/extra/steam.nix
    ../../modules/extra/fingerprint.nix
    ../../modules/extra/plymouth.nix
    inputs.mineral.nixosModules.nix-mineral
  ];

  networking.hostName = "Aries"; # Define your hostname.
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    });
  '';

  nix-mineral = {
    enable = true;
  };

  age.rekey = {
    hostPubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC40CvgW64A29uY/74n8vvF4imHcPQ6RLq3mBIMfY24ovF3pDsViqakth4pvtanqAhUPSeQeyzLchvjtmzPh67asTgIxjg4HK7auey9H3HJFc7ctYUMwn8G2A3SgdJZl9qyF95mwuUWc3Fm1iDDoIATnf+DpkfBXMnNkzCfOEtQ0LdszNde7pfwZZwfRNguIG2VGFRyXZEyjRSYDwdUDxRyp+9LNhJ6enNdqgtqlREoUR4PTp4OQ/2mao91RY3aq1WuenDYnPirxEK2mpAlCa6NhnwVBBbVTvm/BXCxbHPLi/gZvWKvBb6mn3hRD84XiYmX0Jvc0fKHHfOm9OXfkrxTMUna0dpJnRs1D5g0i6w2KlFd8YeQorKA9Vb/TDHfPGvW8AGX/4QQQRkdKB5HGNhF3vbQngyX9thjnrxqYgi14jrpBOXx6ZLD+aafPLKnllLSRBApsoNqsuIOi1tWN+GvsYdraAuqVYceHbWRLFE2uEhmZVdU43ctXayudiWwRVgpuhYxfV3B9bBnLJWzRTYjP27DKSTa3fUatyIU1VmikZJZtl04d0pHt1dJ/XEPnNvl1OlGHorhOO3M+PfBR3RJnLOVZa1f+iWKMQMyX7w+76K8Gvm+f3nzE3qmTccsSNdNYhKu2r0Xsi0PAX1efXXAzwacXY34nJCNLkCF6ItdPQ== root@nixos";
  };

  hyprland.settings.monitor = ''
    monitor=, preferred, auto, 1
  '';
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
