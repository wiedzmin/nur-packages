{ dmenu-python-ng, fetchFromGitHub, lib, pyfzf, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "d4136758a30f60483fc9e7c193626edc07c2020c";
    sha256 = "1g2w3cf7vx9bv0plvx2v9xglac3w759x5i010fi4jys5nvwrq4an";
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
