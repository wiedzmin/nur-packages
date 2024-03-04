{ fetchFromGitHub, stdenv, flex, bison, pkg-config, lib, cligen, openssl, nghttp2, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "clixon";
  version = "5.8.0";

  src = fetchFromGitHub {
    "owner" = "clicon";
    "repo" = "clixon";
    "rev" = "3a9b276debdd7217e0fb4246245772a1e8bb3c71";
    "sha256" = "108jk730n5c8rlc22scaqslrg7qajzp5g292p8ljr7nsn7w6fkka";
  };

  # nativeBuildInputs = [ autoreconfHook pkg-config bison flex ];

  buildInputs = [
    autoreconfHook
    bison
    cligen
    flex
    nghttp2
    openssl
    pkg-config
  ];

  outputs = [ "out" "dev" ];

  # configureFlags = [
  #   "--exec-prefix=${placeholder "out"}"
  # ];

  makeFlags = [ "DESTDIR=$(out)" ];

  # installFlags = [ "DESTDIR=${placeholder "out"}" ];

  meta = with lib; {
    homepage = "https://www.clicon.org/";
    license = with licenses; [ asl20 gpl2 ];
    description = "YANG-based toolchain including NETCONF and RESTCONF interfaces and an interactive CLI";
  };
}
