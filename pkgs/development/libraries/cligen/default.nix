{ fetchFromGitHub, stdenv, flex, bison, pkg-config, lib }:

stdenv.mkDerivation rec {
  name = "cligen";
  version = "5.8.0";

  src = fetchFromGitHub {
    "owner" = "clicon";
    "repo" = "cligen";
    "rev" = "a81bb0df55b30885720bab140de7ec3d2250cc23";
    "sha256" = "000qmdzzxxc970clazw0iy813n8qj6kckgs5vx251kb4lf93vnx5";
  };

  nativeBuildInputs = [ flex bison pkg-config ];

  meta = with lib; {
    homepage = "http://www.cligen.se/";
    license = with licenses; [ asl20 gpl2 ];
    description = "CLIgen is a Command-Line Interface generator.";
  };
}
