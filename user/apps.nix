{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    stremio
    rofimoji # emoji picker
    dolphin # gui file manager
    wtype # wayland typing indicator
    btop # better htop
    flavours # color scheme switcher
    swww
    zathura
    qbittorrent
    pywal
    dolphin # file manager
  ];
}
