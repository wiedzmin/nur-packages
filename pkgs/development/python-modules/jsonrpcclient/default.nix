{ python3Packages, stdenv, apply-defaults, click6 }:

python3Packages.buildPythonPackage rec {
  pname = "jsonrpcclient";
  version = "3.3.4";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1a8b0p8y6gbqqy52lzwkmkaq1bxlwfm9qhs8nsa9zbvkkd060265";
  };

  propagatedBuildInputs = with python3Packages; [
    apply-defaults
    click6
    jsonschema
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/bcb/jsonrpcclient";
    license = licenses.mit;
    description = "Send JSON-RPC requests";
  };
}
