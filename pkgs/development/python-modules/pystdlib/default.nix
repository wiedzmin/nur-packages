{ lib, python3Packages, fetchFromGitHub, pyfzf, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "a432ce91dbfdcc621818d1d2d22c811c1d689050";
    sha256 = "0jp8p5pmi72l23fg0974aqgxr8y5fy12ymszhjc814n8qg65ksyb";
  };

  propagatedBuildInputs = with python3Packages; [ dmenu-python libtmux notify2 pyfzf xlib ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Opinionated python utilities collection";
    homepage = "https://github.com/wiedzmin/pystdlib";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
