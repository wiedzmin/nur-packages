{ lib, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_setuptools";
  version = "0.2.4";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-ZjYp4ev3sgv343LuKi5+vxoVrrO8bUatMuG8shBEyik=";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Custom setuptools version";
    homepage = "https://github.com/dephell/dephell_setuptools";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
