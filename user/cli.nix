{ pkgs, ... }:
let
  shellAliases = {
    ssh = "kitty +kitten ssh";
    please = "sudo $(fc -ln -1)";
    ll = "ls -lha";
    selfdestruct = "tokill=$(pwd) && cd .. && rm -rf $tokill";
    vc = "code --disable-gpu";
  };
in {
  home.packages = with pkgs; [
    zoxide # A faster way to navigate your filesystem cd Alternative
    bat # A cat(1) clone with wings. better syntax highlighting.
    fd # A simple, fast and user-friendly alternative to 'find'
    sd # Intuitive find & replace CLI (sed alternative)
    just # A handy way to save and run project-specific commands
    nushell # A new type of shell
    starship # The minimal, blazing-fast, and infinitely customizable prompt for any shell!
  ];

  programs = {
    nushell = {
      enable = true;
    };
    starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };
  };
}
