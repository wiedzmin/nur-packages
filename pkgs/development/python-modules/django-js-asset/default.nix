{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "django-js-asset";
  version = "1.2.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0q3j2rsdb2i7mvncy9z160cghcggvk87q14qnn7jvcp0sa0awqy1";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/matthiask/django-js-asset/";
    license = licenses.bsdOriginal;
    description = "script tag with additional attributes for django.forms.Media";
  };
}
