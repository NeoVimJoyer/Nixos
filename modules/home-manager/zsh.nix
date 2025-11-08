{ config, lib, ... }:

{
  options.zsh.enable = lib.mkEnableOption "enables zsh" // {
    default = true;
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        #nix = "nom";
        ls = "eza";
        cl = "clear";
        nv = "nvim";
        tr = "tree";
<<<<<<< HEAD
        fetch = "neofetch";
=======
        ff = "fastfetch";
>>>>>>> 8827c46 (laptop stuff)
        py = "python3";
        veiw = "feh";
        shut = "shutdown now";
      };
      history.size = 10000;

      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
        ];
      };
    };
  };
}
