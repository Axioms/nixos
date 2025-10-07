{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "axiom" ]; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
      KexAlgorithms = [
        "-ecdh-sha2-nistp256"
        "ecdh-sha2-nistp384"
        "ecdh-sha2-nistp521"
        "diffie-hellman-group14-sha256"
      ];

      Ciphers = [
        "chacha20-poly1305@openssh.com"
        "aes256-gcm@openssh.com,aes256-ctr"
        "aes192-ctr"
        "aes128-gcm@openssh.com"
        "aes128-ctr"
      ];

      Macs = [
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
        "umac-128-etm@openssh.com"
      ];
    };

    extraConfig = ''
      CASignatureAlgorithms sk-ssh-ed25519@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256
      HostKeyAlgorithms sk-ssh-ed25519-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256
      HostbasedAcceptedAlgorithms sk-ssh-ed25519-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256
      PubkeyAcceptedAlgorithms = sk-ssh-ed25519-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256
      RequiredRSASize 4096'';
  };

  programs.ssh = {
    kexAlgorithms = [
      "-ecdh-sha2-nistp256"
      "ecdh-sha2-nistp384"
      "ecdh-sha2-nistp521"
      "diffie-hellman-group14-sha256"
    ];

    ciphers = [
      "chacha20-poly1305@openssh.com"
      "aes256-gcm@openssh.com,aes256-ctr"
      "aes192-ctr"
      "aes128-gcm@openssh.com"
      "aes128-ctr"
    ];

    macs = [
      "hmac-sha2-512-etm@openssh.com"
      "hmac-sha2-256-etm@openssh.com"
      "umac-128-etm@openssh.com"
    ];

    hostKeyAlgorithms = [
      "sk-ssh-ed25519-cert-v01@openssh.com"
      "ssh-ed25519-cert-v01@openssh.com"
      "rsa-sha2-512-cert-v01@openssh.com"
      "rsa-sha2-256-cert-v01@openssh.com"
      "sk-ssh-ed25519@openssh.com"
      "ssh-ed25519"
      "rsa-sha2-512"
      "rsa-sha2-256"
    ];

    extraConfig = ''
      CASignatureAlgorithms sk-ssh-ed25519@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256
      HostbasedAcceptedAlgorithms sk-ssh-ed25519-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256
      PubkeyAcceptedAlgorithms = sk-ssh-ed25519-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256
      RequiredRSASize 4096'';

  };
}
