{ ... }:

{
  imports = [
    ../default.nix
  ];

  vim.theme = {
    enable = true;
    name = "tokyonight";
    style = "day";
  };
}
