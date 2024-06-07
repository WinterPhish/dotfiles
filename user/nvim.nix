{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    # telescope
    ripgrep
    # markdown
    litemdview
    # lsp
    lua-language-server
    libclang
    # builders
    rustup
    openssl
    openssl.dev
    pkg-config
    gnumake
    nodejs_22
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
