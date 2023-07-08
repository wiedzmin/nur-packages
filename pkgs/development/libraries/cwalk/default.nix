{ fetchFromGitHub, stdenv, cmake, lib }:

stdenv.mkDerivation rec {
  name = "cwalk";
  version = "1.0.3";

  src = fetchFromGitHub {
    "owner" = "likle";
    "repo" = "cwalk";
    "rev" = "cfe8282fce9dcf14cfabe53a253084ff967cfbed";
    "sha256" = "1zwpj4x5apvvr450426fw5vpb4cm7v93smal42nlfg6nj1dws8y0";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    homepage = "https://github.com/likle/cwalk";
    license = with licenses; [ mit ];
    description = ''
      Path library for C/C++. Cross-Platform for Windows, MacOS and Linux.
      Supports UNIX and Windows path styles on those platforms.
    '';
  };
}
