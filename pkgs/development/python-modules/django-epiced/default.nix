{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "django-epiced";
  version = "0.4.3";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0c481mr8s9aizpg4315iaw2ys8x58pi0qxjvqnznzp9nbpshmvyh";
  };

  propagatedBuildInputs = [ python3Packages.markdown ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/belug23/django-epiced";
    license = licenses.bsdOriginal;
    description = "A Django app to add the EpicEditor with easy to use widget.";
  };
}
