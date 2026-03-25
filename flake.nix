{
  description = "NixOS configuration of Wulu Knut";

  nixConfig = {
    substituters = [
      "https://mirrors.cernet.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    quickshell = {
      url = "github:quickshell-mirror/quickshell/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops = {
      url = "github:Mic92/sops-nix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:

    let
      system = "x86_64-linux";

      lib = nixpkgs.lib;

      pkgs = nixpkgs.legacyPackages.${system};

      wulib = import ./libs { inherit lib; };
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          git
          sops
          mkpasswd
          nixfmt-tree
        ];
      };

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs wulib; };

        modules = [
          {
            networking.hostName = "nixos";
          }

          {
            nix = {
              registry.nixpkgs.flake = inputs.nixpkgs;

              settings = {
                experimental-features = [
                  "nix-command"
                  "flakes"
                ];

                trusted-users = [
                  "@wheel"
                  "root"
                ];

                auto-optimise-store = true;
              };

              gc = {
                automatic = true;
                options = "--delete-older-than 7d";
                dates = "weekly";
              };
            };
          }

          {
            nixpkgs = {
              overlays =
                let
                  wuOverlays = import ./overlays { inherit inputs; };
                in
                [
                  wuOverlays.additions
                  wuOverlays.modifications
                ];

              config.allowUnfree = true;
            };
          }

          {
            imports = (wulib.scanPaths ./modules);
          }

          ./hosts
          ./secrets
          ./users
        ];
      };
    };
}
