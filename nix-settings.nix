{...}:
{
	nix = { 
		optimise = {
			automatic = true;
		};
		settings = {
			experimental-features = [ "nix-command" "flakes" ];

			auto-optimise-store = true;
			sandbox = true;
			keep-going = true;
			log-lines = 30;
			warn-dirty = false;
			builders-use-substitutes = true;
			substituters = ["https://cache.garnix.io"];

			trusted-public-keys = ["cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="];
		};
	};
}
