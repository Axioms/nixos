{ pkgs, ... }:

{

  imports = [
    ./vscode.nix
    ./zed.nix
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
    #Rust
    rust-bin.stable.latest.default
    rust-bin.stable.latest.rust-src
  ];
}
