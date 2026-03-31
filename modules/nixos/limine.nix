{ ... }:

{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    limine = {
      enable = true;
      efiSupport = true;
      style.wallpapers = [ ./../../wallpapers/boot.jpg ];
    };
  };
}
