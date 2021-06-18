{ lib, openssl, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "my_cookies";
  version = "0.1.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1c6vpd0wa9fw5aizbqshfxinkmwiccsr3lnzbq7yfiq2hckdyda8";
  };

  propagatedBuildInputs = [ python3Packages.browser-cookie3 ];
  buildInputs = [ openssl ];
  hardeningDisable = ["format"];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/kaiwk/my_cookies";
    license = licenses.mit;
    description = "This package is used for retrieve leetcode cookies from Chrome with local keyring.";
  };
}
