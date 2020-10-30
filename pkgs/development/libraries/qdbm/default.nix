{ fetchFromGitHub, stdenv, doxygen, graphviz, flex, bison, pkgconfig }:

stdenv.mkDerivation rec {
  name = "qdbm";
  version = "unstable";

  src = fetchFromGitHub {
    "owner" = "coapp-packages";
    "repo" = "qdbm";
    "rev" = "098950144e6e36f19165239c483f21f90cd41814";
    "sha256" = "1wlvav33q2096js99vc45y2zrcicbsxfcrc53hyxidmp6qw6bd7v";
  };

  prePatch = ''
    chmod +x configure
    patchShebangs --build configure
  '';

  propagatedBuildInputs = [ doxygen graphviz ];

  nativeBuildInputs = [ flex bison pkgconfig ];

  outputs = [ "out" "lib" "dev" ];

  meta = with stdenv.lib; {
    homepage = "http://fallabs.com/qdbm/";
    license = with licenses; [ asl20 gpl2 ];
    description = "Quick Database Manager.";
  };
}
