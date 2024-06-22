{ pkgs, lib, spicetify-nix, pkgs-unstable, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs-unstable.system}.default;
in
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  imports = [ spicetify-nix.homeManagerModule ];

  programs.spicetify =
    {
      enable = true;
      theme = spicePkgs.themes.text;

      enabledExtensions = with spicePkgs.extensions; [
        keyboardShortcut
        groupSession
        adblock
        playNext
      ];
    };

  home.packages = with pkgs; [
    spotdl
    cava
    cmatrix
    syncthing
    (pkgs.writeShellScriptBin "music-space" ''
      hyprctl dispatch workspace 1 ;
      spotify &
      hyprctl dispatch workspace 1 ;
      kitty cava &
      kitty cmatrix &
    '')
    (pkgs.writeShellScriptBin "update_music" ''
      current_dir=$(pwd)
      cd ~/Music
      spotdl "https://open.spotify.com/playlist/1IFByXt9QiKJvIEZHQ1LmT?si=9955d6a3e7924ce2"
      cd $current_dir
    '')
  ];

}
