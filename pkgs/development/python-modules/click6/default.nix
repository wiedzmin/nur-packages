{ python3Packages, stdenv, locale, substituteAll }:

python3Packages.buildPythonPackage rec {
  pname = "click";
  version = "6.7";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "02qkfpykbq35id8glfgwc38yc430427yd05z1wc5cnld8zgicmgi";
  };

  patches = with stdenv; lib.optional (lib.versionAtLeast version "6.7") (substituteAll {
    src = ./fix-paths.patch;
    locale = "${locale}/bin/locale";
  });

  buildInputs = [ python3Packages.pytest ];

  checkPhase = ''
    py.test tests
  '';

  # https://github.com/pallets/click/issues/823
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "http://click.pocoo.org/";
    description = "Create beautiful command line interfaces in Python";
    longDescription = ''
      A Python package for creating beautiful command line interfaces in a
      composable way, with as little code as necessary.
    '';
    license = licenses.bsd3;
  };
}
