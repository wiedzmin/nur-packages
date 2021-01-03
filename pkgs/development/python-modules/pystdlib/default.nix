{ dmenu-python-ng, fetchFromGitHub, lib, pyfzf, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "19f579661fda45a656e563e6df992c9678fc16e5";
    sha256 = "0w2dk7i1x4qinssdgjjr65cy51q6lav29iz845gq2irrfsbp0dny";
  };

  propagatedBuildInputs = with python3Packages; [ dmenu-python-ng libtmux notify2 pyfzf pygit2 xlib ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Opinionated python utilities collection";
    homepage = "https://github.com/wiedzmin/pystdlib";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
