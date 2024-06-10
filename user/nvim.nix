{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    # theming
    neovim-remote
    # telescope
    ripgrep
    # markdown
    litemdview
    # lsp
    lua-language-server
    nixpkgs-fmt
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
    shellcheck
    shfmt
  ])
  ++ 
  (with pkgs-unstable; [
    neovim
  ]);
}
