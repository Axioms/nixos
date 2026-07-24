{
  pkgs,
  ...
}:

{

  home-manager.users.axiom.programs.neovim = {
    enable = true;
    defaultEditor = false; # this is configured by me elsewhere
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withRuby = false;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      mini-nvim
      onedark-nvim
      guess-indent-nvim
      todo-comments-nvim
      conform-nvim
      nvim-web-devicons
      which-key-nvim
    ];
    initLua = builtins.readFile ./init.lua;
  };

  environment.systemPackages = with pkgs; [
    sqlite
    universal-ctags
    python3
    python3Packages.virtualenv
    lua-language-server
    gcc
  ];

  # env.VIMINIT = "let \\$MYVIMRC='\\$XDG_CONFIG_HOME/nvim/init.lua' | source \\$MYVIMRC";

  environment.shellAliases = {
    nvim = "nvim -u ~/.config/nvim/init.lua";
    vim = "nvim -u ~/.config/nvim/init.lua";
    vi = "nvim -u ~/.config/nvim/init.lua";
    v = "nvim -u ~/.config/nvim/init.lua";
  };
}
