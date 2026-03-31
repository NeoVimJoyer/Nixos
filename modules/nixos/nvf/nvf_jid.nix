{
  inputs,
  pkgs, 
  ...
}:

{
  environment.systemPackages = [ inputs.nvf_jid.packages.${pkgs.system}.default ];
}
