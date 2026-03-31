{
  inputs,
  pkgs, 
  ...
}:

{
  environment.systemPackages = [ inputs.nvf_tron.packages.${pkgs.system}.default ];
}
