{ fetchFromGitHub, stdenv, flex, bison, pkg-config }:

stdenv.mkDerivation rec {
  name = "cligen";
  version = "4.4.0";

  src = fetchFromGitHub {
    "owner" = "wiedzmin";
    "repo" = "cligen";
    "rev" = "d414894edd50063d7eda3c906b0b35998ffe672d";
    "sha256" = "09lrgf9wf98k9c8cb6wmr2pm7qbjydpwcw1rz5ajbygf5v6xczix";
  };

  nativeBuildInputs = [ flex bison pkg-config ];

  meta = with stdenv.lib; {
    homepage = "http://www.cligen.se/";
    license = with licenses; [ asl20 gpl2 ];
    description = "CLIgen is a Command-Line Interface generator.";
  };
}
