{ dephell_specifier, lib, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_pythons";
  version = "0.1.15";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-gEwpr6IUcyKqI+eR9ZHQIE/R6Zg6+n2R4dFFL8e+HFw=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs dephell_specifier packaging ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Work with python versions";
    homepage = "https://github.com/dephell/dephell_pythons";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
