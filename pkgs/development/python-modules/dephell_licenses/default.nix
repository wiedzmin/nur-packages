{ lib, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "dephell-licenses";
  version = "0.1.7";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-8XXOyCKjK9pbVkQvSNrjnvu1w4USdezUHP1+hJ3dLqY=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs requests ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Get info about OSS licenses";
    homepage = "https://github.com/dephell/dephell_licenses";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
