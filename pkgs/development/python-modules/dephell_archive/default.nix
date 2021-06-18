{ lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dephell-archive";
  version = "0.1.7";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-uyY0kqfUMPngTO+aAje3dSzHl6s2S/NecBlq8Jxz6jc=";
  };

  propagatedBuildInputs = with python3Packages; [ attrs ];

  doCheck = false;

  meta = with lib; {
    description = "Pathlib for archives";
    homepage = "https://github.com/dephell/dephell_archive";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
