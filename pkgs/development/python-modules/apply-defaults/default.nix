{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "apply_defaults";
  version = "0.1.4";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0v14nsn2syddg6pk6wqd2ak92njjqr2s69lpib9p71qxlqk67qhw";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/bcb/apply_defaults";
    license = licenses.mit;
    description = "Helps pull configuration into a project.";
  };
}
