{ ... }:

{
  vim = {
    treesitter.enable = false; # Until it stopps throwing error, Im done
  
    enableLuaLoader = true; # Faster loading times
    diagnostics = {
      enable = true;
      config = {
        underling = true;
        virtual_text = true;
      };
    };
    options = {
      tabstop = 2;
      shiftwidth = 2;
      wrap = false;
    };
    syntaxHighlighting = true;

    # Plugins

    # Add assistant here

    telescope.enable = true;
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
    };
    autopairs.nvim-autopairs.enable = true;
    bell = "on";
    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };
    dashboard.alpha = {
      enable = true;
      theme = "theta";
    };
    #debugmode.enable = true; # Figure out how to use this first(figure out a debugger to use first as well)
    filetree.nvimTree = {
      enable = true;
    };
    git = {
      enable = true;
      git-conflict.enable = true;
      gitsigns.enable = true;
    };
    #minimap.codewindow.enable = true; # Code window no longer works
    notify.nvim-notify.enable = true;
    runner.run-nvim.enable = true;
    statusline.lualine.enable = true;
    terminal.toggleterm.enable = true;
    ui = {
      borders.plugins.which-key.enable = true;
      noice.enable = true;
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
      };
      colorful-menu-nvim.enable = true;
      colorizer.enable = true;
      illuminate.enable = true;
      modes-nvim.enable = true;
      nvim-highlight-colors.enable = true;
    };
    undoFile.enable = true;
    utility = {
      icon-picker.enable = true;
      multicursors.enable = true;
      nix-develop.enable = true;
      #nvim-biscuits.enable = true; # Depreciated cause of course
      oil-nvim.enable = true;
      outline.aerial-nvim.enable = true;
      surround.enable = true;
      undotree.enable = true;
    };
    visuals = {
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      nvim-scrollbar.enable = true;
    };
    withPython3 = true;

    lsp.enable = true;
    languages = {
      enableTreesitter = false; # Until they fix their API calls

      nix.enable = true;
      python.enable = true;
      css.enable = true;
      html.enable = true;
      # JS?
      rust.enable = true;
      clang.enable = true; # c/cpp
      csharp.enable = true;
      bash.enable = true;
    };
  };
}
