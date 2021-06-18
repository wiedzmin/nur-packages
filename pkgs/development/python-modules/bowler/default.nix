{ fissix, lib, moreorless, python3Packages, volatile }:

python3Packages.buildPythonPackage rec {
  pname = "bowler";
  version = "0.9.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-zbhc4ue9VFgCoV11XR2vK2oSVCk1XFDSAZqfNdY+Rds=";
  };

  nativeBuildInputs = with python3Packages; [
    setuptools
    setuptools_scm
  ];

  propagatedBuildInputs = with python3Packages; [
    attrs
    click
    fissix
    moreorless
    parameterized
    volatile
  ];

  doCheck = false;

  meta = with lib; {
    description = "Safe code refactoring for modern Python.";
    homepage = "https://github.com/facebookincubator/Bowler";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
