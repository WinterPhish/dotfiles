{pkgs, ...}:
{
  home.packages = with pkgs; [
    spotify
    spotdl
    syncthing
    cava
    cmatrix
  ];
}