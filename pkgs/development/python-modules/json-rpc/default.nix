{ python3Packages, stdenv }:

python3Packages.buildPythonPackage rec {
  pname = "json-rpc";
  version = "1.12.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "0a7zf3z3zdx1kksl76b05gknn0ygk3db8xydk6cd67457jrw6wla";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/pavlov99/json-rpc";
    license = licenses.mit;
    description = "JSON-RPC transport implementation";
  };
}
