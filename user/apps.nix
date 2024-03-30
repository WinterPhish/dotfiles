{pkgs, ...}:
{
  home.packages = with pkgs; [
    discord    
    stremio
    rofimoji # emoji picker
    wl-clipboard # wayland clipboard manager
    wtype # wayland typing indicator
  ];
}