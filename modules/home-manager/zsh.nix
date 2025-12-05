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

      initContent = ''
        if [[ $LAST_COMMAND != "" ]]; then
          precmd() { print "end of line" }
        fi

        preexec() { LAST_COMMAND="$1" }
      ''; # Not working for some reason

      shellAliases = {
        ls = "eza";
        cl = "clear";
        nv = "nvim";
        tr = "tree";
        ff = "fastfetch";
        veiw = "feh";

        clmk = "make clean; make; make run";
        
        dev = "nix develop";
        dev-c = "nix develop ~/dev-flakes/c/";
        dev-py = "nix develop ~/dev-flakes/python/";
        
        py = "python";
        gpp = "g++";
        
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
