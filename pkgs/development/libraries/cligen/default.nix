{
  bison,
  fetchFromGitHub,
  flex,
  lib,
  pkg-config,
  stdenv
}:

stdenv.mkDerivation rec {
  pname = "cligen";
  version = "6.5.0";

  src = fetchFromGitHub {
    "owner" = "clicon";
    "repo" = pname;
    "rev" = version;
    "sha256" = "1jifgng74xsbrq2h0g8wgmzzkdpikz7v14ali842zbxs36iy65qi";
  };

  nativeBuildInputs = [ flex bison pkg-config ];

  meta = with lib; {
    homepage = "http://www.cligen.se/";
    license = with licenses; [ asl20 gpl2 ];
    description = "CLIgen is a Command-Line Interface generator.";
  };
}
