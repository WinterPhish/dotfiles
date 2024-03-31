{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    spotdl
    syncthing
    cava
    cmatrix
    (pkgs.writeShellScriptBin "music-space" ''
      spotify &
      sleep 1;
      kitty cava &
      kitty cmatrix &
    '')
  ];
}
