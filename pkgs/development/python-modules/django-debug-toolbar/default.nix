{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "django-debug-toolbar";
  version = "2.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1a77jckf2bgz1faidrsc6l5a01xhn7n12xaqlvh4h5hfdjy5gh94";
  };

  propagatedBuildInputs = with python3Packages; [ django sqlparse ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/jazzband/django-debug-toolbar";
    license = licenses.bsdOriginal;
    description = "A configurable set of panels that display various debug information about the current request/response.";
  };
}
