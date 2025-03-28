{
  inputs = {
  	nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
	home-manager.url = github:nix-community/home-manager;
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
	flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, flake-parts, home-manager, ... }@inputs: {
    nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
      ./configuration.nix 
      home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sanuki = import ./home;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
  };
}
