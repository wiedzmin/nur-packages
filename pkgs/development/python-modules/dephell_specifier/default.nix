{ lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_specifier";
  version = "0.2.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-texkCaGRaYDEhh2iy3U4JGVVv/S5W+8slSxWvRnrLeY=";
  };

  propagatedBuildInputs = with python3Packages; [ packaging ];

  doCheck = false;

  meta = with lib; {
    description = "Work with version specifiers (can parse PEP-440, SemVer, Ruby, NPM, Maven)";
    homepage = "https://github.com/dephell/dephell_specifier";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
