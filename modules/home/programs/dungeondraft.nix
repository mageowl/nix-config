{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (pkgs)
    stdenv
    requireFile
    dpkg
    xorg
    libGL
    alsa-lib
    pulseaudio
    libkrb5
    zlib
    steam-run-free
    ;
  dungeondraft = stdenv.mkDerivation rec {
    pname = "dungeondraft";
    version = "1.2.0.1";

    src = requireFile {
      name = "Dungeondraft-${version}-Linux64.deb";
      url = "https://dungeondraft.net/";
      hash = "sha256-UvvUCQ1RkhwBPMet/zD0JjI7DPbF4ixzOX85Fi3v/BE=";
    };

    nativeBuildInputs = [
      dpkg
    ];

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp -R usr/share opt $out/
      substituteInPlace \
        $out/share/applications/Dungeondraft.desktop \
        --replace /opt/ $out/opt/ \
        --replace "Exec=" "Exec=${steam-run-free}/bin/steam-run "
      ln -s $out/opt/Dungeondraft/Dungeondraft.x86_64 $out/bin/Dungeondraft.x86_64
      runHook postInstall
    '';
    preFixup = let
      libPath = lib.makeLibraryPath [
        xorg.libXcursor
        xorg.libXinerama
        xorg.libXrandr
        xorg.libX11
        xorg.libXi
        xorg.libXext
        xorg.libXrender
        libGL
        alsa-lib
        pulseaudio
      ];
      libmonoNativeLibPath = lib.makeLibraryPath [libkrb5];
      libmonoPosixHelperLibPath = lib.makeLibraryPath [zlib];
    in ''
      patchelf \
        --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        --set-rpath "${libPath}" \
        $out/opt/Dungeondraft/Dungeondraft.x86_64
      chmod +x \
        $out/opt/Dungeondraft/data_Dungeondraft/Mono/lib/*
      patchelf \
        --set-rpath "${libmonoNativeLibPath}" \
        $out/opt/Dungeondraft/data_Dungeondraft/Mono/lib/libmono-native.so
      patchelf \
        --set-rpath "${libmonoPosixHelperLibPath}" \
        $out/opt/Dungeondraft/data_Dungeondraft/Mono/lib/libMonoPosixHelper.so  '';

    meta = with lib; {
      homepage = "https://dungeondraft.net/";
      description = "Mapmaking tool for Tabletop Roleplaying Games, designed for dungeon or combat scale";
      license = licenses.unfree;
      platforms = ["x86_64-linux"];
      maintainers = with maintainers; [mageowl];
      sourceProvenance = with sourceTypes; [binaryNativeCode];
    };
  };
in {
  home.packages = lib.mkIf config.opts.dungeondraft.enable [dungeondraft];
}
