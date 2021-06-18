{ lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_discover";
  version = "0.2.10";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-oq1BTl4P4WyCxTfWoxmK/ZgYwMAQdg7Msj4tYOW2bfY=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs ];

  doCheck = false;

  meta = with lib; {
    description = "Find project modules and data files (packages and package_data for setup.py).";
    homepage = "https://github.com/dephell/dephell_discover";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
