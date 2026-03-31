{
  lib,
  ...
}:

{
  options.defaultPkgs = {
    enable = lib.mkEnableOption "Enables the default pkgs for home manager" // {
      default = true;
    };
  };

  imports = [
    ./zsh.nix
    ./alacritty.nix
    ./eza.nix
    ./lf.nix
    ./floorp.nix
    ./rofi.nix
  ];
}
