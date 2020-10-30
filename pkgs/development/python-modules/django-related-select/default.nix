{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "django-related-select";
  version = "0.9.3";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "150rghb84m0qbmbg5ncfw9c0536li8br9p4xxwsldavvlr6kwiv2";
  };

  propagatedBuildInputs = [ python3Packages.django ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/zachmccormick/django-related-select";
    license = "UNKNOWN";
    description = "Class-based View and django form field for related select boxes";
  };
}
