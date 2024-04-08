{pkgs, ...}:
{
  home.packages = with pkgs; [
    discord    
    stremio
    rofimoji # emoji picker
    wtype # wayland typing indicator
    btop # better htop
    pywal
    swww
    zathura
  ];
}