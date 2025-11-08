{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };

  environment = {
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatabilitytools.d";
    };
    systemPackages = with pkgs; [
      mangohud
      protonup
    ];
  };
}
