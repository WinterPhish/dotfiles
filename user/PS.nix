{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gdb
    gcc

    (pkgs.writeShellScriptBin "reset_PS" ''
      cd ~/projects/PS ;
      for i in mmed*; do
        rm $i
      done
      for i in {0..5} ; do
        cat template.txt > mmed$i.cpp
      done
    '')

  ];
}