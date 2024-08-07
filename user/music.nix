{ pkgs, ... }:
{
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
      spotdl "https://open.spotify.com/playlist/3GOuMMAxB75Gf1rjPNRley"
      cd $current_dir
    '')
  ];
}
