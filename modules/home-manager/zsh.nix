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
        ls = "eza";
        cl = "clear";
        nv = "nvim";
        tr = "tree";
        ff = "fastfetch";
        
        dev = "nix develop";
        dev-c = "nix develop ~/dev-flakes/c/";
        dev-py = "nix develop ~/dev-flakes/python/";
        
        py = "python";
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
