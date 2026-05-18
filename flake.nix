{
  description = "My system configuration";

  inputs = {
    # TODO : unstable ?
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, disko, nixpkgs, home-manager, niri, sops-nix, stylix, ...}:
    let
      inherit (self) outputs;
      mkSystem = {host, system ? "x86_64-linux"}:
        nixpkgs.lib.nixosSystem {
          modules = [
            { nixpkgs.hostPlatform = system; nixpkgs.config.allowUnfree = true; }
            disko.nixosModules.disko
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
            }
            niri.nixosModules.niri
            ./hosts/${host}/disko.nix
            ./hosts/${host}/configuration.nix
          ];
          specialArgs = {inherit inputs outputs;};
        };
    in
    {
      nixosConfigurations = {
        carbonara = mkSystem { host = "carbonara"; }; # Laptop
        tiramisu = mkSystem { host = "tiramisu"; }; # NAS
      };
      # formatter here ?
    };
}

