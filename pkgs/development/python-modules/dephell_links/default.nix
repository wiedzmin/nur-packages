{ lib, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_links";
  version = "0.1.5";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-KNaUFC4oJ6WdLDAecYWvtS+4rNuVCx2jgwjWnkNBjqo=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Parse dependency links";
    homepage = "https://github.com/dephell/dephell_links";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
