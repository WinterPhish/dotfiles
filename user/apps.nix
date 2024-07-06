{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    stremio
    rofimoji # emoji picker
    dolphin # gui file manager
    wtype # wayland typing indicator
    btop # better htop
    flavours # color scheme switcher
    dooit # cli todo list
    swww
    unclutter
    mpvpaper
    zathura
    tree
    docker
  ])
  ++
  (with pkgs-unstable; [
    nh
    nix-output-monitor
    nvd
    ags
  ]);
}
