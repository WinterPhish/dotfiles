{ config, pkgs, ... }:

let
  dotdir = "/home/mmed/dotfiles";
  static_files = "${dotdir}/config_files/static";
in
{
  home.username = "mmed";
  home.homeDirectory = "/home/mmed";

  home.stateVersion = "23.11";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./CLI/default.nix
    ./apps.nix
    ./music.nix
    ./hyprland.nix
    ./music.nix
    ./vanity.nix
    ./vscode.nix
    ./temp/PFE.nix
  ];

  home.packages = with pkgs; [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/kitty.conf";
    ".config/hypr/keybindings.conf".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/keybindings.conf";
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/starship.toml";
    ".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/hyprland.conf";
  };

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 28;
    gtk.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "firefox";
  };

  # GIT configuration
  programs.git = {
    enable = true;
    userName = "mmed";
    userEmail = "mmed.benhadjnasr@gmail.com";
  };

  programs.home-manager.enable = true;
}
