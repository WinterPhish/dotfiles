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
    mpvpaper
    zathura
    tree
  ])
  ++
  (with pkgs-unstable; [
    nh
    nix-output-monitor
    discord
    nvd
    ags
  ]);
}
