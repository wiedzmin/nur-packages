{ dmenu-python-ng, fetchFromGitHub, lib, pyfzf, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "04b8e6ad80dc98d948ee600c905ddf07f87a3ab8";
    sha256 = "0rmk2pd16c0c3lkdqi6204vqgaq6qxfxz5vy58cfdgrhlwdv5a9w";
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
