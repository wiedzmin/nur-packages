{ dephell_pythons, lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_venvs";
  version = "0.1.18";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-xzBykbdU7boyWrJ+3rBdhe5N0vFIfEiHKh6/w3K/ei4=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs dephell_pythons requests ];

  doCheck = false;

  meta = with lib; {
    description = "Manage virtual environments";
    homepage = "https://github.com/dephell/dephell_venvs";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
