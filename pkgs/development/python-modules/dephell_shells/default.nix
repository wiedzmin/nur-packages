{ lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_shells";
  version = "0.1.5";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-dxULcy2xNdQ29BwsbxJpTmBYqGCSFBF+6A9sQCNKwtU=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs packaging pexpect shellingham ];

  doCheck = false;

  meta = with lib; {
    description = "Activate virtual environment for current shell";
    homepage = "https://github.com/dephell/dephell_shells";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
