{ lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_versioning";
  version = "0.1.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-m6djZwSve9ZK9aZKuO+0gsiwv0hoaZci9eJkd2Pt+OU=";
  };

  propagatedBuildInputs = with python3Packages; [ packaging ];

  doCheck = false;

  meta = with lib; {
    description = "Bump project version like a pro";
    homepage = "https://github.com/dephell/dephell_versioning";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
