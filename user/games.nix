{ pkgs, ... }:
{
  home.packages = with pkgs; [
    qbittorrent
    (pkgs.writeShellScriptBin "transfer_game" ''
      sudo mount /dev/sda1 $HOME/aux
      sudo rsync --info=progress2 -r $1 $HOME/aux 
    '')
  ];
}
