{ config, pkgs, UserSettings, ... }:
let
  static_files = UserSettings.dotfilesDir+"/config_files/static";
in
{
  home.username = UserSettings.username;
  home.homeDirectory = UserSettings.homeDir;

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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/kitty.conf";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/hypr";
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/starship.toml";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/waybar";
    ".config/scripts".source = config.lib.file.mkOutOfStoreSymlink "${UserSettings.dotfilesDir}/config_files/scripts";
    ".config/yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/yazi.toml";
  };

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 28;
    gtk.enable = true;
  };

  home.sessionVariables = {
    EDITOR = UserSettings.tty_editor;
    BROWSER = UserSettings.browser;
  };

  # GIT configuration
  programs.git = {
    enable = true;
    userName = UserSettings.username;
    userEmail = UserSettings.email;
  };

  programs.home-manager.enable = true;
}
