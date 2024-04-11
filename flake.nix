{
  description = "mmed configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    xremap-flake.url = "github:xremap/nix-flake";
    #stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      SystemSettings = {
        system = "x86_64-linux";
        hostname = "mmedPC";
        timezone = "Africa/Tunis";
        locale = "en_US.UTF-8";
      };
      UserSettings = rec {
        username = "mmed";
        email = "mmed.benhadjnasr@gmail.com";
        homeDir = "/home/" + UserSettings.username;
        dotfilesDir = UserSettings.homeDir + "/dotfiles";
        configDir = UserSettings.homeDir + "/.config";
        screenshotDir = UserSettings.homeDir + "/Screenshots";
        scriptsDir = UserSettings.dotfilesDir + "/config_files/scripts";
        wm = "hyprland";
        browser = "firefox";
        terminal = "kitty";
        tty_editor = "vim";
        editor = "code --disable-gpu";
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
      nixosConfigurations.mmedPC = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
          inherit SystemSettings;
        };
        inherit system;
        modules = [
          ./system/configuration.nix
        ];
      };
      homeConfigurations.mmed = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit UserSettings;
          inherit pkgs-unstable;
        };
        modules = [
          ./user/home.nix
        ];
      };
    };
}
