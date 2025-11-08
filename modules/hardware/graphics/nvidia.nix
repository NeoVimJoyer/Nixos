{ ... }:

{
  hardware = {
    # Throwing an error, but Im too lazy to fix it right now becuase I am installing steam anyway
    #opengl = {
    #enable = true;
    #  driSupport = true;
    #  driSupport32Bit = true;
    #};
    nvidia = {
      modesetting.enable = true;
      open = true;
    };
  };

  #services.xserver.videoDrivers = ["nvidia"];
}
