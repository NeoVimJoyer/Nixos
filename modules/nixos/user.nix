{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    callum.autologin.enable = lib.mkEnableOption "enables autologin of user callum" // {
      default = false;
    };
  };

  config = {
    users.users.callum = {
      isNormalUser = true;
      description = "Main User";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [ ];
    };

    programs.zsh.enable = true;

    # Enable autologin
    services.getty.autologinUser = lib.mkIf config.callum.autologin.enable "callum";
  };
}
