{ python3Packages, stdenv, django-js-asset, django-mptt }:

python3Packages.buildPythonPackage rec {
  pname = "django-filer";
  version = "1.7.0"; # NOTE: latest is 2.0.2

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0pmrykyzrmvf1iba1vwanqnwv56j1dalifd81hpw5dfh3m8c2rf7";
  };

  propagatedBuildInputs = with python3Packages; [
    asgiref
    django
    django-polymorphic
    easy-thumbnails
    pillow
    pytz
    six
    sqlparse
    unidecode

    django-js-asset
    django-mptt
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "File and Image Management Application for django";
    homepage = "https://github.com/django-cms/django-filer";
    license = licenses.bsd3;
    broken = true;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
