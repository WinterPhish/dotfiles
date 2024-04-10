{
  description = "mmed configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    xremap-flake.url = "github:xremap/nix-flake";
    #stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
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
    in
    {
      nixosConfigurations.mmedPC = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
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
        };
        modules = [
          ./user/home.nix
        ];
      };
    };
}
