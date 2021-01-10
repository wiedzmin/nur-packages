{ dmenu-python-ng, fetchFromGitHub, lib, pyfzf, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "4b450ad75de2bc5a47b86bbee50e07f51a978cbc";
    sha256 = "02k2a39nihnhnl2pnsava1vmjnl4rpff3cah0b8wamk1m5flphjm";
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
