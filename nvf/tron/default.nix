{ ... }:

let
  colors = import ./../../modules/colors/tron.nix;
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
}
