{ pkgs, ... }:

{

  imports = [
    ./vscode.nix
  ];

  nixpkgs.config.android_sdk.accept_license = true;
  environment.systemPackages = with pkgs; [
    android-tools
    arduino-ide
    arduino-core
    arduino-language-server
    filezilla
    git
    godot
    kdePackages.isoimagewriter
    just
    meld
    nil
    niv
    nixd
    nixfmt
    octave
    postman
    qFlipper
    scrcpy
    sdrpp
    solvespace
    unstable.hyprls
    optnix
    deadnix
    zed-editor-fhs
  ];
}
