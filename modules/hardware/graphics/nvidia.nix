{ config, ... }:

{
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    # Throwing an error, but Im too lazy to fix it right now becuase I am installing steam anyway
    #opengl = {
    #enable = true;
    #  driSupport = true;
    #  driSupport32Bit = true;
    #};

    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        intelBusId = "PCI:00:00.0";
        nvidiaBusId = "PCI:01:00.0";
      };
    };
  };

  #services.xserver.videoDrivers = ["nvidia"];
}
