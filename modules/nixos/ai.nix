{ inputs, pkgs, ... }:

{
  environment.systemPackages = with inputs.nix-ai-tools.packages.${pkgs.system}; [
    claude-code
    gemini-cli
  ];
}
