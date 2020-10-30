{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "django-modern-rpc";
  version = "0.11.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1wcb3rfsjlg59w9lfnndrz5bif0wnka884pljpj60klz2gjbzw0r";
  };

  propagatedBuildInputs = [ python3Packages.django ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/alorence/django-modern-rpc";
    license = licenses.mit;
    description = "Simple and modern JSON-RPC and XML-RPC server implementation for Django";
  };
}
