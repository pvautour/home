{
  description = "Home Manager configuration of pvautour";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:nix-community/stylix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      nixos-hardware,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      # Define pkgs ONCE and reuse
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations."zephyrus-g15" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          nixos-hardware.nixosModules.asus-zephyrus-ga503
          stylix.nixosModules.stylix
          ./hosts/zephyrus-g15/configuration.nix
          home-manager.nixosModules.default
        ];
      };

      homeConfigurations."pvautour_work@CPC-Pasca-YGTW5" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/work/work.nix
        ];
        extraSpecialArgs = {
          userSettings = {
            username = "pvautour_work";
            homeDirectory = "/home/pvautour_work";
          };
        };
      };
    };
}
