{ config, lib, pkgs, inputs, ... }:
let
  zfsCompatibleKernelPackages = lib.filterAttrs (
    name: kernelPackages:
    (builtins.match "linux_[0-9]+_[0-9]+" name) != null
    && (builtins.tryEval kernelPackages).success
    && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
  ) pkgs.linuxKernel.packages;
  latestKernelPackage = lib.last (
    lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
      builtins.attrValues zfsCompatibleKernelPackages
    )
  );
in
{
  # ZFS Specific things
  boot.supportedFilesystems = [ "zfs" ];
  boot.initrd.supportedFilesystems = ["zfs"];
  boot.kernelPackages = latestKernelPackage;
  # TODO : maybe change to use options in modules ?
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/acme.nix
    ../../modules/system/bootloader.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/gc.nix
    ../../modules/system/networking.nix
    ../../modules/system/nextcloud.nix
    ../../modules/system/sops.nix
    ../../modules/system/ssh.nix
  ];

  home-manager.users.redgl0w = {
    imports = [
      inputs.noctalia.homeModules.default
      ../../modules/home/base.nix
      ../../modules/home/git.nix
    ];
  };

  networking.hostName = "tiramisu";
  networking.hostId = "ff2ecef9"; # Required by ZFS

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

  environment.systemPackages = with pkgs; [ git vim ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  system.stateVersion = "25.11";
}

