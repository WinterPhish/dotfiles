{ pkgs, ... }:
{
  home.packages = with pkgs; [
    teams-for-linux
    terraform
    azure-cli
  ];
}
