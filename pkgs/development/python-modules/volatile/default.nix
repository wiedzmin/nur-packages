{ lib, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "volatile";
  version = "2.1.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-m+Nq1QjjNU4BbBFd4Dl9wiA7mACnPZ0XfKnTeo06MdM=";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "A small extension for the tempfile module.";
    homepage = "https://github.com/mbr/volatile";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
