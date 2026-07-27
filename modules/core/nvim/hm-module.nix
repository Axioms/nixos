{
  pkgs,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    sqlite
    universal-ctags
    python3
    python3Packages.virtualenv
    lua-language-server
    gcc
  ];

  programs.neovim = {
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
}
