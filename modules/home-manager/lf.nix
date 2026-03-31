{ 
  lib,
  config, 
  ...
}:

{
  config = lib.mkIf config.defaultPkgs.enable {
    # Defined in defaultPkgs.nix
    programs.lf = {
      enable = true;
      # Add some keybinds here
    };
  };
}
