{ config, pkgs, ... }:

{

  imports = [
    ./vscode.nix
  ];

  nixpkgs.config.android_sdk.accept_license = true;
  environment.systemPackages = with pkgs; [
    #android-studio-full
    android-tools
    arduino-ide
    arduino-core
    arduino-language-server
    bambu-studio
    filezilla
    git
    godot
    isoimagewriter
    just
    meld
    nil
    niv
    nixd
    nixfmt-rfc-style
    octave
    postman
    qFlipper
    scrcpy
    sdrpp
    solvespace
    unstable.hyprls
  ];
}
