{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    spotdl
    syncthing
    cava
    cmatrix
    syncthing
    (pkgs.writeShellScriptBin "music-space" ''
      spotify &
      sleep 1;
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
