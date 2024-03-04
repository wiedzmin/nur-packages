{ fetchFromGitHub, stdenv, flex, bison, pkg-config, lib, cligen, openssl, nghttp2, autoreconfHook }:

stdenv.mkDerivation rec {
  pname = "clixon";
  version = "6.5.0";

  src = fetchFromGitHub {
    "owner" = "clicon";
    "repo" = pname;
    "rev" = version;
    "sha256" = "12i926rri52plwbyv8ga5b74m3ndkxbhhy85v9xmz6rvajkq8zwz";
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
