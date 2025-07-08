{ dmenu-python-ng, fetchFromGitHub, lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "0.9";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "70e64709ce6bdda05eebfc5d9cd32b96e666e9ea";
    sha256 = "1mqnp5bf04jjfg6vw4ydg9dw80m3fb8j4794kpqgff63zfv02gx4";
  };

  propagatedBuildInputs = with python3Packages; [ dmenu-python-ng libtmux notify2 papis-python-rofi pyfzf pygit2 xlib ];

  doCheck = false;

  meta = with lib; {
    description = "Opinionated python utilities collection";
    homepage = "https://github.com/wiedzmin/pystdlib";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
  };
}
