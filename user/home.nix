{ config, pkgs, ... }:

{
  home.username = "mmed";
  home.homeDirectory = "/home/mmed";

  home.stateVersion = "23.11"; 

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./cli.nix
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
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mmed/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "firefox";
  };

  # GIT configuration
  programs.git = {
    enable = true;
    userName  = "mmed";
    userEmail = "noreply@gmail.com";
  };

  programs.home-manager.enable = true;
}
