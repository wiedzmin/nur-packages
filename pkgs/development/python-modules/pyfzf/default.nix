{ fzf, lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "pyfzf";
  version = "0.2.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0inbc96m9k4yfn7bxqwxpk9kx00axl8sckql5f7r3c1kpxaymxyq";
  };

  propagatedBuildInputs = with python3Packages; [ fzf plumbum ];

  doCheck = false;

  meta = with lib; {
    description = "A python wrapper for fzf";
    homepage = "https://github.com/nk412/pyfzf";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
