{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kooha
    openshot-qt
    haruna
    teams-for-linux
    terraform
    azure-cli
  ];
}
