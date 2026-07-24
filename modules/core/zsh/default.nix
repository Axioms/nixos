{
  pkgs,
  config,
  ...
}:

{

  environment.systemPackages = [
    pkgs.vivid
    pkgs.bat
  ];

  home-manager.users."${config.system.PrimaryUser}" = {
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
        HISTSIZE=50000
        SAVEHIST=50000
        ZSH_COLORIZE_STYLE="onedark"

        if [[ -n $SSH_CONNECTION ]]; then
          export EDITOR='nvim'
        else
          export EDITOR='code'
        fi

        if [ $TERM = 'xterm-kitty' ]; then
          alias ssh="kitten ssh"
        fi
      '';

      history.append = true;
      shellAliases = {
        logout = "loginctl terminate-user ${config.system.PrimaryUser}";
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
        theme = "powerlevel10k/powerlevel10k";
        plugins = [
          "colorize"
          "common-aliases"
          "cp"
          "docker"
          "git"
          "git-auto-fetch"
          "gpg-agent"
          "nmap"
          "npm"
          "ssh"
          "ssh-agent"
          "sudo"
          "systemd"
          "tmux"
          "z"
        ];
      };
    };
  };
}
