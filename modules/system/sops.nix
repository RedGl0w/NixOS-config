{ inputs, pkgs, ...}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.age.keyFile = "/home/redgl0w/.config/sops/age/keys.txt";

  environment.systemPackages = with pkgs; [
    sops
  ];
}
