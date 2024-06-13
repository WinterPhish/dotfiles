{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    nsxiv
    xorg.xrdb
    (pkgs.writeShellScriptBin "wall-select" ''
      generate=false
      print_usage() {
        printf "Usage: wall-select [-g]"
        printf "  -g: generate a theme from the selected wallpaper"
      }

      while getopts 'g' flag; do
        case "$flag" in
        g) generate=true ;;
        *)
          print_usage
          exit 1
          ;;
        esac
      done

      theme=$(flavours current)
      if [[ ! -d ~/wallpapers/$theme ]] || [[ $generate == true ]]; then
        theme="aux"
      fi
      imgpath=$(nsxiv -tbo -s F ~/wallpapers/$theme)
      if [[ ! $imgpath ]]; then
        exit 0
      fi
      swww img --transition-type random --transition-duration=2 --transition-fps=120 $imgpath
      cp $imgpath ~/wallpapers/current/$theme.jpg
      if [[ $generate == true ]]; then
        flavours generate dark $imgpath
        flavours apply generated
      fi
    '')
    (pkgs.writeShellScriptBin "wall-theme" ''
      theme=$(flavours current)
      if [[ ! -d ~/wallpapers/$theme ]]; then
        theme="aux"
      fi
      if [[ ! -f ~/wallpapers/current/$theme.jpg ]]; then
        random_wallpaper=$(ls -1 ~/wallpapers/$theme | shuf -n 1)
        cp ~/wallpapers/$theme/$random_wallpaper ~/wallpapers/current/$theme.jpg 
      fi
      swww img --transition-type random --transition-duration=2 --transition-fps=120 ~/wallpapers/current/$theme.jpg
    '')
    (pkgs.writeShellScriptBin "theme-select" ''
      imgpath=$(nsxiv -tbo -s F ~/wallpapers/current)
      if [[ ! $imgpath ]]; then
        exit 0
      fi
      swww img --transition-type random --transition-duration=2 --transition-fps=120 $imgpath
      theme=$(basename -s .jpg $imgpath)
      if [[ $theme == "aux" ]]; then
        flavours generate dark $imgpath
        flavours apply generated
      else 
        flavours apply $theme
      fi
    '')
  ]);
}

