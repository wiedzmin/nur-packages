{ lib, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "yaspin";
  version = "1.2.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-cunNvA55fviGw3P+8rzWUmpwSkcGlvnXjQuyeVH+ZZo=";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "A lightweight terminal spinner for Python with safe pipes and redirects";
    homepage = "https://github.com/pavdmyt/yaspin";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
