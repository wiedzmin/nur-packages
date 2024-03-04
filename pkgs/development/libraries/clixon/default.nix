{ fetchFromGitHub, stdenv, flex, bison, pkg-config, lib, cligen, openssl, nghttp2, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "clixon";
  version = "6.5.0";

  src = fetchFromGitHub {
    "owner" = "clicon";
    "repo" = "clixon";
    "rev" = "a1badc312eafdf0300558eaed46905406bf336fa";
    "sha256" = "1j5s1b32klh0glpj9x2z7xfxns46x9vgsm9d7sr17q1ykskdqpzc";
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
