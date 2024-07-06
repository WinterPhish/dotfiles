{ pkgs, ... }: {
  home.packages = with pkgs; [ xdg-utils ];
  xdg.userDirs = {
    enable = true;
    download = "$HOME/Downloads";
    documents = "$HOME/Documents";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
    music = "$HOME/Music";
  };
}
