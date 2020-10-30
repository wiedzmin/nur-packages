{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "django-choices";
  version = "1.7.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1pzzbhc9l122a3pjai2x6qkimbcpxdr0q5h6gkyvbxzpdjwkc3rw";
  };

  propagatedBuildInputs = [ python3Packages.django ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/bigjason/django-choices";
    license = licenses.mit;
    description = "Sanity for the django choices functionality.";
  };
}
