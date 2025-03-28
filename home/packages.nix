{pkgs, ...}: {
  programs.go.enable = true;

  home.packages = with pkgs; [
    vscode-fhs
    qbittorrent
    google-chrome
    anytype
lollypop
wine
mpv
vlc
htop

    warp-terminal
  ];
}
