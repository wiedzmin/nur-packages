{ dmenu-python-ng, fetchFromGitHub, lib, pyfzf, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "94bf693ab51aa4eecb9425dcbd85605cc79fbe72";
    sha256 = "1vrml6w64b1qql29kj8ypmd43igcsckpqlc2a9spfaa0r450z93d";
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
