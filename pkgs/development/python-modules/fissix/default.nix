{ lib, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "fissix";
  version = "20.8.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-1ugKZKybr/MouLGxgAAuuLSIvy2ww8VV71F1DuAFVxo=";
  };

  propagatedBuildInputs = with python3Packages; [ appdirs ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "backport of lib2to3, with enhancements";
    homepage = "https://github.com/jreese/fissix";
    license = licenses.psfl;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
