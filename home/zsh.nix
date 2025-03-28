{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "robbyrussell";
    };

    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "fast-syntax-highlighting";
          rev = "v1.55";
          sha256 = "sha256-DWVFBoICroKaKgByLmDEo4O+xo6eA8YO792g8t8R7kA=";
        };
      }
    ];

    shellAliases = {
      hmu = "home-manager switch";
      du = "${pkgs.lib.getExe pkgs.du-dust}";
      m = "mkdir -p";
      ls = "ls --color=yes";
      cat = "${pkgs.lib.getExe pkgs.bat}";
      grep = "${pkgs.lib.getExe pkgs.ripgrep}";
      npm = ''${pkgs.lib.getExe' pkgs.nodePackages_latest.pnpm "pnpm"}'';
    };

    sessionVariables = {EDITOR = "nvim";};
  };
  programs.nix-index.enable = true;
}
