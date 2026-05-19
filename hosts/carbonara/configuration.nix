{ config, lib, pkgs, inputs, ... }:
{
  # TODO : maybe change to use options in modules ?
  imports = [
    stylix.nixosModules.stylix
    ./hardware-configuration.nix
    ../../modules/system/bootloader.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/gc.nix
    ../../modules/system/gnome.nix
    ../../modules/system/local.nix
    ../../modules/system/ly.nix
    ../../modules/system/niri.nix
    ../../modules/system/nix-ld.nix
    ../../modules/system/networking.nix
    ../../modules/system/printscan.nix
    ../../modules/system/sops.nix
    ../../modules/system/sound.nix
    ../../modules/system/stylix.nix
  ];

  home-manager.users.redgl0w = {
    imports = [
      inputs.noctalia.homeModules.default
      ../../modules/home/base.nix
      ../../modules/home/c.nix
      ../../modules/home/communication.nix
      ../../modules/home/editor.nix
      ../../modules/home/firefox.nix
      ../../modules/home/git.nix
      ../../modules/home/kitty.nix
      ../../modules/home/hdl.nix
      ../../modules/home/media.nix
      ../../modules/home/niri.nix
      ../../modules/home/noctalia.nix
      ../../modules/home/ocaml.nix
    ];
  };

  networking.hostName = "carbonara";

  sops.secrets."system/user/redgl0w-hash" = {
    sopsFile = ./secrets.yml;
    neededForUsers = true;
  };

  users.users.redgl0w = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [];
    hashedPasswordFile = config.sops.secrets."system/user/redgl0w-hash".path;
  };

  environment.systemPackages = with pkgs; [ git ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  system.stateVersion = "25.11";
}

