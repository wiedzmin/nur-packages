{ lib, stdenv, fetchurl, makeWrapper, jre }:

stdenv.mkDerivation rec {
  pname = "code-maat";
  version = "1.0.3";

  src = fetchurl {
    url = "https://github.com/adamtornhill/code-maat/releases/download/v${version}/code-maat-${version}-standalone.jar";
    sha256 = "sha256-cAaGX9BX27Z2GN583YmhagWsBIygVc0ZDkzbspM9OJw=";
  };

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase =
    let
      jar = "$out/libexec/code-maat/code-maat.jar";
    in
    ''
      install -D ${src} ${jar}
      mkdir -p "$out/bin"
      makeWrapper "${jre}/bin/java" "$out/bin/code-maat" \
          --add-flags "-jar ${jar}"
    '';

  meta = with lib; {
    description = "A command line tool to mine and analyze data from version-control systems";
    homepage = "https://github.com/adamtornhill/code-maat";
    platforms = platforms.unix;
    license = licenses.gpl3;
  };
}
