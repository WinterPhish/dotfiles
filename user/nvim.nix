{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    # telescope
    ripgrep
    # lsp
    lua-language-server
    libclang
    # builders
    rustup
    gnumake
    gcc
    wget
    python3
    # formatters
    stylua
  ])
  ++ 
  (with pkgs-unstable; [
    neovim
  ]);
}
