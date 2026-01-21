{ ... }:

let
  colors = import ./../../modules/colors/tron.nix;
in
{
  vim = {
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
    theme = {
      enable = true;
      name = "base16";
      base16-colors = {
        base00 = "${colors.black}";
        base01 = "${colors.black}";
        base02 = "${colors.black}";
        base03 = "${colors.gray}";
        base04 = "${colors.blue}";
        base05 = "${colors.blue}";
        base06 = "${colors.blue}";
        base07 = "${colors.white}";
        base08 = "${colors.red}";
        base09 = "${colors.white}";
        base0A = "${colors.blue}";
        base0B = "${colors.green}";
        base0C = "${colors.yellow}";
        base0D = "${colors.white}";
        base0E = "${colors.yellow}";
        base0F = "${colors.white}";
      };
    };

    # Plugins
    assistant.avante-nvim = {
      enable = true;
      setupOpts.behavior = {
        enable_claude_text_editor_tool_mode = false; # Maybe change later?
        enable_cursor_planning_mode = false; # Same as above
        auto_suggestions = true;
        support_paste_from_clipboard = true;
      };
    };
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
    };
    dashboard.alpha = {
      enable = true;
      #layout = []; # Configure someday
      theme = "theta";
    };
    #debugmode.enable = true; # Figure out how to use this first(figure out a debugger to use first as well)
    filetree.nvimTree = {
      enable = true;
    };
    #formatter.conform-nvim.enable = true; # Figure out how to use it
    git = {
      enable = true;
      git-conflict.enable = true;
      gitsigns.enable = true;
    };
    minimap.codewindow.enable = true;
    notify.nvim-notify.enable = true;
    #python3Packages # Figure out if you need any
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
      #new-file-template # Figure this one out
      nix-develop.enable = true;
      nvim-biscuits.enable = true;
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
      enableTreesitter = true;

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
