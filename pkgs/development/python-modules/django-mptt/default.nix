{ python3Packages, stdenv, django-js-asset }:

python3Packages.buildPythonPackage rec {
  pname = "django-mptt";
  version = "0.10.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0pmrykyzrmvf1iba1vwanqnwv56j1dalifd81hpw5dfh3m8c2rf7";
  };

  propagatedBuildInputs = with python3Packages; [
    django
    django-js-asset
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/django-mptt/django-mptt";
    license = licenses.mit;
    description = ''
      Utilities for implementing Modified Preorder Tree Traversal
      with your Django Models and working with trees of Model instances.
    '';
  };
}
