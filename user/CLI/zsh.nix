{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history.size = 1000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    initExtra = ''
      function update {
        current_dir=$(pwd)
        cd ~/.dotfiles
        nix flake update
        sudo nixos-rebuild switch --flake .
        home-manager switch --flake .
        echo "Update complete"
        cd $current_dir
      }

      function reload {
        current_dir=$(pwd)
        cd ~/.dotfiles
        home-manager switch --flake .
        echo "Reload complete"
        cd $current_dir
      }

      function full_reload {
        current_dir=$(pwd)
        cd ~/.dotfiles
        sudo nixos-rebuild switch --flake .
        home-manager switch --flake .
        echo "Reload complete"
        cd $current_dir
      }

      echo "Welcome Mmed!!"
    '';
      };
  }
