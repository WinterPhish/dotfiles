{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    ripgrep
    gnumake
  ])
  ++ 
  (with pkgs-unstable; [
    neovim
  ]);
}
