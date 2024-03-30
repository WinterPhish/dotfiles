{ config, pkgs, ... }:

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
  ];

  home.packages = with pkgs; [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink ./../config_files/kitty.conf;
  };

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 25;
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
