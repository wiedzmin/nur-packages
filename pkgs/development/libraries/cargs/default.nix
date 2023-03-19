{ fetchFromGitHub, stdenv, cmake, lib }:

stdenv.mkDerivation rec {
  name = "cargs";
  version = "1.0.3";

  src = fetchFromGitHub {
    "owner" = "likle";
    "repo" = "cargs";
    "rev" = "bd21f6d8e4e809343171a7a52c9e3259459d19e9";
    "sha256" = "1viazp8gfhmw5lj1yybvimz7a7sb9rz1kmvrp3zhnf7kjggb67v9";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    homepage = "https://likle.github.io/cargs/";
    license = with licenses; [ mit ];
    description = ''
      Cargs is a lightweight C/C++ command line argument parser library
      which can be used to parse argv and argc parameters passed to a
      main function.
    '';
  };
}
