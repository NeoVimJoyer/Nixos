{
  inputs,
  pkgs, 
  ...
}:

{
  environment.systemPackages = [ inputs.nvf_light.packages.${pkgs.system}.default ];
}
