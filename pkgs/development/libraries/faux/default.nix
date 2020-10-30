{ autoreconfHook, pkgs, fetchgit, stdenv }:

stdenv.mkDerivation rec {
  name = "faux";
  version = "unstable";

  src = fetchgit {
    url = "https://src.libcode.org/pkun/faux";
    rev = "ebf2002ea86e7ef4bf18bedae8e3a9c57404e104";
    sha256 = "1ywvyrhs2jrr0slmjg7n4pfwjplzxwh60vslmvww0vc55y8gkkf6";
  };

  nativeBuildInputs = [ autoreconfHook ];

  outputs = [ "out" "lib" "dev" ];

  meta = with stdenv.lib; {
    homepage = "https://src.libcode.org/pkun/faux";
    license = "unknown";
    description = "Utility library for Klish - http://klish-cli.blogspot.com/";
  };
}
