{
  pkgs,
  ...
}:

{

  environment.systemPackages = [
    pkgs.vivid
    pkgs.bat
  ];

  home-manager.users.axiom = {
    home.file.".p10k.zsh" = {
      source = ./p10k.zsh;
      force = true;
    };

    programs.zsh = {
      enable = true;

      autosuggestion.enable = true;
      initContent = ''
        fastfetch
        export MANPAGER="sh -c 'col -bx | bat -l man -p'"
        export LS_COLORS="$(vivid generate snazzy)"
        source ~/.p10k.zsh
        ZSH_COLORIZE_STYLE="onedark"
        DISABLE_UPDATE_PROMPT="true"
        DISABLE_MAGIC_FUNCTIONS="true"
        COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
        HIST_STAMPS="%d/%m/%y %H:%M:%S"
        ZSH_COLORIZE_STYLE="colorful"
        HISTSIZE=50000
        SAVEHIST=50000
      '';
      history.append = true;
      shellAliases = {
        logout = "loginctl terminate-user axiom";
      };
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
      oh-my-zsh = {
        enable = true;
        plugins = [
          "archlinux"
          "arduino-cli"
          #"dnf"
          "colorize"
          "common-aliases"
          "colored-man-pages"
          "docker"
          "docker-compose"
          #"docker-machine"
          #"dotenv"
          "emoji"
          "firewalld"
          "git"
          "gpg-agent"
          #"last-working-dir"
          "nmap"
          "npm"
          "pip"
          "screen"
          "ssh"
          "ssh-agent"
          "sudo"
          "systemd"
          "tmux"
          "ufw"
          #"vagrant"
          "vscode"
          "z"
        ];
      };
    };
  };
}
