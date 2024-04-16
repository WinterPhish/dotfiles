{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    pkgs.nixpkgs-fmt
    pkgs-unstable.vscode
    pkgs.texliveFull
  ];
}
