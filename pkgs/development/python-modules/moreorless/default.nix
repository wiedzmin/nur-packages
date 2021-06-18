{ volatile, lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "moreorless";
  version = "0.3.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-XBxfC9bB5ZDiWi/AxGb9Jv8mseoEZhsEsVEEPHz2ePQ=";
  };

  nativeBuildInputs = with python3Packages; [
    click
    parameterized
    setuptools
    setuptools_scm
    volatile
  ];

  doCheck = false;

  meta = with lib; {
    description = "Wrapper to make difflib.unified_diff more fun to use";
    homepage = "https://github.com/thatch/moreorless/";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
