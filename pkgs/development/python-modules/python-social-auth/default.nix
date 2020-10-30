{ python3Packages, stdenv, social-auth-core }:

python3Packages.buildPythonPackage rec {
  pname = "python-social-auth";
  version = "0.3.6";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0x1ffbv1g95ylcgz0fh4dsbs2w73xc9qm4slbkhswd39yw6j51k9";
  };

  propagatedBuildInputs = [ social-auth-core ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/omab/python-social-auth";
    license = licenses.bsdOriginal;
    description = "Python social authentication made simple.";
  };
}
