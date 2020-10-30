{ python3Packages, stdenv, social-auth-core }:

python3Packages.buildPythonPackage rec {
  pname = "social-auth-app-django";
  version = "3.1.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0y4phjpipyajis70fcr8l4jfcnbgs927pmcpa1aclwcy5n6d23bd";
  };

  propagatedBuildInputs = [
    python3Packages.six
    social-auth-core
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/python-social-auth/social-app-django";
    license = licenses.bsdOriginal;
    description = "Python Social Authentication, Django integration.";
  };
}
