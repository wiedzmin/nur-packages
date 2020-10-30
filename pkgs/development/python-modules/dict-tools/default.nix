{ python3Packages, stdenv, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  name = "dict-tools";
  version = "unstable";

  src = fetchFromGitHub {
    "owner" = "nikitinsm";
    "repo" = "python-dict-tools";
    "rev" = "68c9e2c807f5db1a2c750265b7ab7e06ed3e0b4b";
    "sha256" = "1vs5msarz1m857hf0xd8zcdpl1q1d2sapr6hbaqp4aff03wmsc02";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/sergio-bershadsky/python-dict-tools";
    license = licenses.mit;
    description = "The agile query language for semi-structured data.";
  };
}
