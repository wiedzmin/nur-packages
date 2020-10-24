{ lib, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "dephell_argparse";
  version = "0.1.3";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-KrmyRB+Ai7EcM4xISdIt7YmM3oMllGgArJ450rE4c10=";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Argparse with groups, commands, colors, and fuzzy matching.";
    homepage = "https://github.com/dephell/dephell_argparse";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
