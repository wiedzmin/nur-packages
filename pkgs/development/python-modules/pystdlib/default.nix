{ dmenu-python-ng, fetchFromGitHub, lib, pyfzf, python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "pystdlib";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wiedzmin";
    repo = "pystdlib";
    rev = "e79238cbaf1e9acdb73c1367247af8269e592f34";
    sha256 = "17wv94gmw1hmh6am8vkvq2ibkzi070qyjl86p6gaxp45rclr5vx7";
  };

  propagatedBuildInputs = with python3Packages; [ dmenu-python-ng libtmux notify2 papis-python-rofi pyfzf pygit2 xlib ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Opinionated python utilities collection";
    homepage = "https://github.com/wiedzmin/pystdlib";
    license = licenses.mit;
    maintainer = with lib.maintainers; [ wiedzmin ];
  };
}
