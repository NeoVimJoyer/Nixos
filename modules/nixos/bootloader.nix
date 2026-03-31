{ ... }:

{
  boot.loader = {
    #efi = {
    #  canTouchEfiVariables = true;
    #  efiSysMountPoint = "/boot/efi";
    #};
    #grub = {
    #  efiSupport = true;
    #  device = "nodev";
    #  theme = "/home/callum/config/wallpapers/boot.jpg";
    #};

    systemd-boot.enable = true;
    efi.canTouchEfiVariables  = true;
  };
}
