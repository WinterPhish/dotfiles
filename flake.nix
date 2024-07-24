{
  description = "home config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    xremap-flake.url = "github:xremap/nix-flake";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    anyrun.url = "github:Kirottu/anyrun";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, spicetify-nix, anyrun, ... }@inputs:
    let
      SystemSettings = {
        system = "x86_64-linux";
        hostname = "nixos";
        timezone = "Canada/Toronto";
        locale = "en_US.UTF-8";
      };
      UserSettings = {
        username = "akira";
        email = "trimasitisu.battle@gmail.com";
        homeDir = "/home/" + UserSettings.username;
        dotfilesDir = UserSettings.homeDir + "/dotfiles";
        configDir = UserSettings.homeDir + "/.config";
        screenshotDir = UserSettings.homeDir + "/Screenshots";
        scriptsDir = UserSettings.dotfilesDir + "/config_files/scripts";
        wm = "hyprland";
        browser = "firefox";
        terminal = "kitty";
        tty_editor = "nvim";
        editor = "nvim";
      };
      lib = nixpkgs.lib;
      system = SystemSettings.system;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = lib.nixosSystem {
        environment.systemPackages = [ anyrun.packages.${system}.anyrun ];
        specialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
          inherit SystemSettings;
        };
        inherit system;
        modules = [
          /etc/nixos/configuration.nix
        ];
      };
      homeConfigurations.akira = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit UserSettings;
          inherit pkgs-unstable;
          inherit spicetify-nix;
          inherit anyrun;
        };
        modules = [
          ./user/home.nix
          ./user/spicetify.nix
        ];
      };
    };
}
