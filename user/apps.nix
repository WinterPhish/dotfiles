{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    discord
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
    pywal
    dolphin # file manager
  ])
  ++
  (with pkgs-unstable; [
    nh
    nix-output-monitor
    nvd
    ags
  ]);
}
