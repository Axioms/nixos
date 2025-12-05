{ config, pkgs, ... }:

{
  home-manager.users.axiom = {

    home.file."looking-glass-client.ini" = {
      enable = true;
      executable = false;
      target = ".looking-glass-client.ini";
      text = ''
        [win]
        borderless=yes
        fullScreen=yes
        maximize=yes
        size=3400x1440
        autoResize=yes
        ignoreQuit=yes
        noScreensaver=yes
        position=center

        [input]
        captureOnFocus=yes
        grabKeyboardOnFocus=yes
        mouseSmoothing=no
        rawMouse=yes
        mouseSens=3
        releaseKeysOnFocusLoss=false
        captureOnly=yes
        autoCapture=yes
        ;escapeKey=KEY_UP

        [spice]
        port=5902
        captureOnStart=yes
        clipboard=no
        clipboardToVM=no
        clipboardToLocal=no
        audio=yes
        largeCursorDot=yes
        captureOnStart=yes

        [audio]
        micShowIndicator=yes
        micDefault=deny

        [opengl]
        vsync=no

        [app]
        renderer=EGL
        shmFile=/dev/kvmfr0

        [egl]
        vsync=no
        ;nvGain=1

        [wayland]
        warpSupport=yes
        fractionScale=yes
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    looking-glass-client
  ];
  
  services.udev.enable = true;
  services.udev.extraRules = ''
    SUBSYSTEM=="kvmfr", GROUP="kvm", MODE="0660"
  '';

  virtualisation.libvirtd.qemu.verbatimConfig = ''
    cgroup_device_acl = [
        "/dev/null", "/dev/full", "/dev/zero",
        "/dev/random", "/dev/urandom",
        "/dev/ptmx", "/dev/kvm",
        "/dev/kvmfr0"
    ]
  '';

  #  systemd.tmpfiles.rules = [
  #    "f /dev/shm/looking-glass 0660 axiom qemu-libvirtd -"
  #  ];
}
