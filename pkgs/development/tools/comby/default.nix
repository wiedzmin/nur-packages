{ autoPatchelfHook, fetchurl, lib, pcre, pkgconfig, sqlite, stdenv, zlib }:

stdenv.mkDerivation rec {
  pname = "comby";
  version = "1.7.0";

  src = fetchurl {
    url = "https://github.com/comby-tools/comby/releases/download/${version}/comby-${version}-x86_64-linux.tar.gz";
    sha256 = "01rh4m45gzzc79b56b6kp5yri0x04cgn44jr6l3c4clf00p09zzc";
  };

  # The tarball is just the prebuilt binary, in the archive root.
  sourceRoot = ".";
  dontBuild = true;
  dontConfigure = true;

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ pcre.out pkgconfig sqlite.out zlib.out ];

  binary = "comby-${version}-x86_64-linux";
  binary_out = "comby";
  installPhase = ''
    #echo INSTALLING.
    mkdir -p $out/bin
    mkdir -p $out/lib
    cp -r ${pcre.out}/lib/* $out/lib
    ln -s $out/lib/libpcre.so.1 $out/lib/libpcre.so.3
    cp -r ${sqlite.out}/lib/* $out/lib
    cp -r ${zlib.out}/lib/* $out/lib
    mv ${binary} $out/bin/${binary_out}
    chmod a+x $out/bin/${binary_out}
    #ls -la $out/bin
    #echo INSTALLING DONE.
  '';

  meta = with lib; {
    description = "A tool for changing code across many languages";
    homepage = "https://comby.dev/";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" ];
  };
}
