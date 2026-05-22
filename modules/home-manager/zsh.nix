{ config, lib, ... }:

{
  options.zsh.enable = lib.mkEnableOption "enables zsh" // { default = true; };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initContent = ''
        typeset -g _mcp_ran=0
        autoload -Uz add-zsh-hook
        add-zsh-hook preexec _mcp_mark
        add-zsh-hook precmd  _mcp_announce
        _mcp_mark() {
          case "''${1%% *}" in
            clear|cl) _mcp_ran=0 ;;
            *)        _mcp_ran=1 ;;
          esac
        }
        _mcp_announce() {
          (( _mcp_ran )) && print -P "%F{red}\nEND OF LINE\n%f"
          _mcp_ran=0
        }
      '';

      shellAliases = {
        lc = "sl";
        vn = "sl";
        mr = "sl";
        pc = "sl";
        vm = "sl";
        km = "sl";

        ls = "eza";
        cl = "clear";
        nv = "nvim";
        tr = "tree";
        ff = "fastfetch";
        veiw = "feh";

        dev = "nix develop";
        dev-c = "nix develop ~/dev-flakes/c/";
        dev-py = "nix develop ~/dev-flakes/python/";
        
        py = "python";
        gpp = "g++";

        mk = "make";
        cptempc = "cp ~/templates/c/* . -rf";
        cptempcpp = "cp ~/templates/cpp/* . -rf";
        cpmkc = "cp ~/templates/c/Makefile .";
        cpmkcpp = "cp ~/templates/cpp/Makefile .";
        
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
