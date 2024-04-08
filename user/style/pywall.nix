# to theme:
# firefox -> pywal
# vscode -> pywal
# kitty -> pywal
# wallpaper -> pywal/stylix
# discord -> 
# spotify
# xdg
# qt
# cava
{pkgs, ...}:
{
  home.packages = with pkgs; [
    pywall
  ];
}