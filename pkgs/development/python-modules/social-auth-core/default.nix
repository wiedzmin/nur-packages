{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "social-auth-core";
  version = "3.2.0";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0n1v3rzll0r89s62shvw6n13d1p1pd1abvb8i4ayncm591jnc843";
  };

  propagatedBuildInputs = with python3Packages; [
    defusedxml
    oauthlib
    pyjwt
    python3-openid
    requests
    requests_oauthlib
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/python-social-auth/social-core";
    license = licenses.bsdOriginal;
    description = "Python social authentication made simple.";
  };
}
