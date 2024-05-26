{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    # telescope
    ripgrep
    # lsp
    rust-analyzer
    lua-language-server
    libclang
    # builders
    gnumake
    gcc
    wget
    python3
    cargo
    # formatters
    stylua
    rustfmt
  ])
  ++ 
  (with pkgs-unstable; [
    neovim
  ]);
}
