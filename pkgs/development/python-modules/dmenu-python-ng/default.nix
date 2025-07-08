{ dmenu-ng, lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "dmenu-python-ng";
  version = "0.2.1";
  format = "setuptools";

  src = python3Packages.fetchPypi {
    inherit version;
    pname = "dmenu";
    sha256 = "06v2fq0ciallbib7sbk4kncj0n3gdqp1kz8n5k2669x49wyh34wm";
  };

  propagatedBuildInputs = [ dmenu-ng ];

  # No tests existing
  doCheck = false;

  meta = with lib; {
    description = "A Python wrapper for dmenu";
    homepage = "https://dmenu.readthedocs.io";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
  };
}
