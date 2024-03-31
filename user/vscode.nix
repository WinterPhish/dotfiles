{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixpkgs-fmt
    vscode
    texliveFull
  ];
}
