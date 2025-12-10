{ pkgs, ... }:

{
  hardware.ipu6 = {
    enable = true;
    platform = "ipu6";
  };

  environment.systemPackages = with pkgs; [
    cheese
  ];
}
