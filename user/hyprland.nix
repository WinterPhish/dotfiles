{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar
  ];
  # Todo: fix swaylock-effects
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      fade_in = 0.2;
      effect-blur = true;
      screenshots = true;
    };
  };
}
