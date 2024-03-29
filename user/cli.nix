{ pkgs, ... }:
let
  shellAliases = {
    ssh = "kitty +kitten ssh";
    please = "sudo $(fc -ln -1)";
    ll = "ls -lha";
    selfdestruct = "tokill=$(pwd) && cd .. && rm -rf $tokill";
    vc = "code --disable-gpu";
  };
in
{
  home.packages = with pkgs; [
    carapace # A shell configuration framework
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
      # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
      # configFile.source = ./../config_files.nu;
      # for editing directly to config.nu 
      extraConfig = ''
        let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
        }
        $env.config = {
         edit_mode: "vi", 
         show_banner: false,
         completions: {
         case_sensitive: false # case-sensitive completions
         quick: true    # set to false to prevent auto-selecting completions
         partial: true    # set to false to prevent partial filling of the prompt
         algorithm: "fuzzy"    # prefix or fuzzy
         external: {
         # set to false to prevent nushell looking into $env.PATH to find more suggestions
             enable: false 
         # set to lower can improve completion performance at the cost of omitting some options
             max_results: 100 
             completer: $carapace_completer # check 'carapace_completer' 
           }
         }
        } 
      '';
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
    starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };
  };
}
