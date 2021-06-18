{ dephell_specifier, lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_markers";
  version = "1.0.3";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-Ul4XkU5wWs+GUt2GgfzN7JEkMqdH2N70cg9JQWgX8tQ=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs dephell_specifier packaging ];

  doCheck = false;

  meta = with lib; {
    description = "Work with environment markers (PEP-496).";
    homepage = "https://github.com/dephell/dephell_markers";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
