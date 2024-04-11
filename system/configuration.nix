# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, SystemSettings, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hyprland.nix
      ./virtual.nix
      # ./virt.nix
      inputs.xremap-flake.nixosModules.default
    ];

  #* xremap configuration
  services.xremap.withHypr = true;
  services.xremap.config.modmap = [
    {
      name = "Global";
      remap = { "CapsLock" = "Esc"; }; # globally remap CapsLock to Esc
    }
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Enable networking
  networking.hostName = SystemSettings.hostname;
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = SystemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = SystemSettings.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = SystemSettings.locale;
    LC_IDENTIFICATION = SystemSettings.locale;
    LC_MEASUREMENT = SystemSettings.locale;
    LC_MONETARY = SystemSettings.locale;
    LC_NAME = SystemSettings.locale;
    LC_NUMERIC = SystemSettings.locale;
    LC_PAPER = SystemSettings.locale;
    LC_TELEPHONE = SystemSettings.locale;
    LC_TIME = SystemSettings.locale;
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # users
  users.users.mmed = {
    isNormalUser = true;
    description = "mmed";
    # default shell
    extraGroups = [ "networkmanager" "wheel" "mmed"];
  };

  # Shell
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs_unstable.config.allowUnfree = true;

  # Gtk configuration
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.systemPackages = with pkgs; [
    #* dotfiles
    home-manager

    #* notification
    inotify-tools

    #* Development
    git
    vim
    gh
    kitty
    unzip # self-explanatory 

    #* sound and video
    pamixer
    brightnessctl
    playerctl

    #* browser
    firefox

    #* file manager
    yazi

    #* fonts
    font-awesome

    #* bluetooth
    bluez-tools
    blueberry

    #* Shells
    nushell
    zsh
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerdfonts
    meslo-lgs-nf
  ];

  # # enable auto-updates
  # system.autoUpgrade = {
  #   enable = true;
  #   flake = inputs.self.outPath;
  #   flags = [
  #     "--update-input"
  #     "nixpkgs"
  #     "-L"
  #   ];
  #   dates = "09:00";
  #   randomizedDelaySec = "45min";
  # };

  system.stateVersion = "23.11"; 

}
