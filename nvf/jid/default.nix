{ ... }:

let
  colors = import ./../../modules/colors/jid.nix;
in
{
  imports = [
    ../default.nix
  ];

  vim.theme = {
    enable = true;
    name = "base16";
    base16-colors = {
      base00 = "${colors.black}";
      base01 = "${colors.black}";
      base02 = "${colors.black}";
      base03 = "${colors.gray}";
      base04 = "${colors.yellow}";
      base05 = "${colors.yellow}";
      base06 = "${colors.yellow}";
      base07 = "${colors.white}";
      base08 = "${colors.red}";
      base09 = "${colors.white}";
      base0A = "${colors.yellow}";
      base0B = "${colors.green}";
      base0C = "${colors.orange}";
      base0D = "${colors.white}";
      base0E = "${colors.orange}";
      base0F = "${colors.white}";
    };
  };
}
