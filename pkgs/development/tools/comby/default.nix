{ autoPatchelfHook, fetchurl, lib, pcre, pkgconfig, sqlite, stdenv, zlib }:

stdenv.mkDerivation rec {
  pname = "comby";
  version = "0.16.0";

  src = fetchurl {
    url = "https://github.com/comby-tools/comby/releases/download/${version}/comby-${version}-x86_64-linux.tar.gz";
    sha256 = "13flbm1h44w8rkvq80sybv0hw2i9s5i2w21q310h6ywa5mf8dgnk";
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
