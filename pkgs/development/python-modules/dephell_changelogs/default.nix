{ lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_changelogs";
  version = "0.0.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-5jmj0I04niL7rAzGQYHb6TxLS6nwE04nPm3T4mrnCyE=";
  };

  propagatedBuildInputs = with python3Packages; [ requests ];

  doCheck = false;

  meta = with lib; {
    description = "Find changelog for github repository, local dir, parse changelog";
    homepage = "https://github.com/dephell/dephell_changelogs";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
