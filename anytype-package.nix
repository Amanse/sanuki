# anytype-overlay.nix
self: super: {
  anytype = super.stdenv.mkDerivation rec {
    pname = "anytype";
    version = "0.45.3";

    src = super.fetchurl {
      url = "https://github.com/anyproto/anytype-ts/releases/download/v0.45.3/Anytype-0.45.3.AppImage";
      sha256 = "0d0hkgf6wxr5yx2wzl7rfwlxxh2gxl3d1a76wzlywwf8dxjv7r7j";  # Update with the correct sha256 hash
    };

    nativeBuildInputs = [ super.appimage-run ];

    installPhase = ''
      mkdir -p $out/bin
      chmod +x ${src}
      mv ${src} $out/bin/anytype
      ln -s $out/bin/anytype $out/bin/anytype-launch
    '';

    meta = with super.lib; {
      description = "Anytype: Personal Knowledge Management tool";
      homepage = "https://anytype.io";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };
}

