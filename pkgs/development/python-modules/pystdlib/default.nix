{ lib, python3Packages, fetchFromGitHub, pyfzf, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "ec557a8d57440de08d31aae9f5050018621a8a2e";
    sha256 = "sha256-Zg6SLlsUg9ysUEqpPQGpx46jZYLY9AlWOfokr4Sh0O8=";
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
