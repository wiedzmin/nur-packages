{ lib, python3Packages, fetchFromGitHub, patches ? [ ./replace-inputdevice.fn-with-inputdevice.path.patch ] }:

python3Packages.buildPythonApplication rec {
  pname = "keyszer";
  version = "unstable";
  pyproject = true;
  disabled = python3Packages.pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "joshgoebel";
    repo = "keyszer";
    rev = "485026c773383d3d7d84373e351985c39cc7aa2e";
    hash = "sha256-cvJH2k5HfLlW2zcAxfmtllIM1YMSIXyxBEKaYSa7/5A=";
  };

  inherit patches;

  build-system = [
    python3Packages.setuptools
  ];

  dependencies = with python3Packages; [
    hatchling
    evdev
    xlib
    inotify-simple
    appdirs
    ordered-set
  ];

  doCheck = false;

  meta = with lib; {
    description = "a smart, flexible keymapper for X11 (a fork/reboot of xkeysnail)";
    homepage = "https://github.com/joshgoebel/keyszer";
    license = licenses.gpl3;
    platforms = platforms.unix;
    maintainers = with lib.maintainers; [ wiedzmin ];
  };
}
