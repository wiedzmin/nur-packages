{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "drest";
  version = "0.9.12";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0bjlar9kswp9353rka0jx0q31n6h5m2q1h7bmfx4965r34ysb22x";
  };

  propagatedBuildInputs = [ python3Packages.httplib2 ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "http://github.com/datafolklabs/drest/";
    license = licenses.bsdOriginal;
    description = "dRest API Client Library for Python";
  };
}
