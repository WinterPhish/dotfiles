{ pkgs, UserSettings, ... }:
{
  home.packages = with pkgs; [
    hyprshade # Shader for screenshot
    waybar # Status bar
    swappy # image viewer
    grimblast # Screenshot tool
    wl-clipboard # Clipboard manager
    pavucontrol # Pulseaudio volume control

    # Screenshot script
    (pkgs.writeShellScriptBin "screenshot" ''
      # Restores the shader after screenhot has been taken
      restore_shader() {
      	if [ -n "$shader" ]; then
      		hyprshade on "$shader"
      	fi
      }

      # Saves the current shader and turns it off
      save_shader() {
      	shader=$(hyprshade current)
      	hyprshade off
      	trap restore_shader EXIT
      }

      save_shader # Saving the current shader

      if [ -z "$XDG_PICTURES_DIR" ]; then
      	XDG_PICTURES_DIR="$HOME/Pictures"
      fi

      swpy_dir="${UserSettings.configDir}/swappy"
      save_dir="$XDG_PICTURES_DIR/screenshots"
      save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
      temp_screenshot="/tmp/screenshot.png"

      mkdir -p $save_dir
      mkdir -p $swpy_dir
      echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" >$swpy_dir/config

      function print_error
      {
      	cat <<"EOF"
          ./screenshot.sh <action>
          ...valid actions are...
              p  : print all screens
              s  : snip current screen
              sf : snip current screen (frozen)
              m  : print focused monitor
      EOF
      }

      case $1 in
      p) # print all outputs
      	grimblast copysave screen $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
      s) # drag to manually snip an area / click on a window to print it
      	grimblast copysave area $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
      sf) # frozen screen, drag to manually snip an area / click on a window to print it
      	grimblast --freeze copysave area $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
      m) # print focused monitor
      	grimblast copysave output $temp_screenshot && restore_shader && swappy -f $temp_screenshot ;;
      *) # invalid option
      	print_error ;;
      esac

      rm "$temp_screenshot"
    '')
  ];
}
