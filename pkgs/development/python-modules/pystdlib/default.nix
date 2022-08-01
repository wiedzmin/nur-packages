{ dmenu-python-ng, fetchFromGitHub, lib, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "82d2cfc64acc71ec7a69106e13f9ccf1c51348c6";
    sha256 = "1l1i072mcsbjgyabya18w8w6vsghk6d023vhqy6d3s6srcfwfay8";
  };

  propagatedBuildInputs = with python3Packages; [ dmenu-python-ng libtmux notify2 papis-python-rofi pyfzf pygit2 xlib ];

  doCheck = false;

  meta = with lib; {
    description = "Opinionated python utilities collection";
    homepage = "https://github.com/wiedzmin/pystdlib";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
