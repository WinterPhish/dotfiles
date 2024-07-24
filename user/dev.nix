{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    neovim
    lazygit
    nodejs
    python3
    python312Packages.pynvim
    lunarvim
    rustup
  ])
  ++ 
  (with pkgs-unstable; [
    vscode
  ]);
}
