{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
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
    (pkgs.writeShellScriptBin "color-nvim" ''
      ls $XDG_RUNTIME_DIR/nvim.*.0 \
     	| xargs -I {} nvim --server {} --remote-send "<Esc>:source ~/.config/nvim/lua/mmed/colors.lua<CR>"
    '')
  ])
  ++
  (with pkgs-unstable; [
    neovim
  ]);
}
