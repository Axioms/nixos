{ inputs, ... }:

{

  disabledModules = [ "services/desktops/pipewire/pipewire.nix" ];
  imports = [
    "${inputs.nixpkgs-unstable}/nixos/modules/services/desktops/pipewire/pipewire.nix"
  ];

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
