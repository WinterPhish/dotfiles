{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    nixpkgs-fmt
    texliveFull
  ])
  ++ 
  (with pkgs-unstable; [
    vscode
  ]);
}
