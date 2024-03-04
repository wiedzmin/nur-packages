{
  autoreconfHook,
  bison,
  cligen,
  fetchFromGitHub,
  flex,
  lib,
  libtool,
  nghttp2,
  openssl,
  pkg-config,
  stdenv
}:

stdenv.mkDerivation rec {
  pname = "clixon";
  version = "6.5.0";

  src = fetchFromGitHub {
    "owner" = "clicon";
    "repo" = pname;
    "rev" = version;
    "sha256" = "12i926rri52plwbyv8ga5b74m3ndkxbhhy85v9xmz6rvajkq8zwz";
  };

  nativeBuildInputs = [
    autoreconfHook
    libtool
    pkg-config
  ];

  buildInputs = [
    bison
    cligen
    flex
    nghttp2
    openssl
  ];

  preConfigure = ''
    libtoolize --force
  '';

  makeFlags = [ "DESTDIR=$(out)" ];

  meta = with lib; {
    homepage = "https://www.clicon.org/";
    license = with licenses; [ asl20 gpl2 ];
    description = "YANG-based toolchain including NETCONF and RESTCONF interfaces and an interactive CLI";
  };
}
