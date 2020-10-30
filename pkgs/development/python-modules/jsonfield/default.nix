{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "jsonfield";
  version = "2.0.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0d5qmjja31rgcj524qy8x527fx81dj1cpvys68f3bmnna14cvcdy";
  };

  propagatedBuildInputs = [ python3Packages.django ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/dmkoch/django-jsonfield/";
    license = licenses.mit;
    description = "A reusable Django field that allows you to store validated JSON in your model.";
  };
}
