{ pkgs, ... }:

{
  boot = {
    kernelModules = ["nouveau"];
    blacklistedKernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" "nvidia_modset" ];
  };
  services.xserver = {
    enable = true;
    videoDrivers = ["nouveau"];
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      mesa.drivers
    ];
  };
}
