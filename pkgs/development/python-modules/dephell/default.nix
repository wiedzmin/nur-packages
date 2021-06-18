{ bowler, dephell_archive, dephell_argparse, dephell_changelogs, dephell_discover,
  dephell_licenses, dephell_links, dephell_markers, dephell_pythons, dephell_setuptools,
  dephell_shells, dephell_specifier, dephell_venvs, dephell_versioning, fissix, lib,
  python3Packages, yaspin }:

python3Packages.buildPythonPackage rec {
  pname = "dephell";
  version = "0.8.3";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-qfzFKKDG+fXXISkr34RuUzjk3KfNb+8VUfvnFWTf5h4=";
  };

  prePatch = ''
    substituteInPlace setup.py \
      --replace "pip<=19.3.1,>=18.0" "pip"
  '';

  propagatedBuildInputs = with python3Packages; [
    aiohttp
    attrs
    bowler
    cerberus
    certifi
    dephell_archive
    dephell_argparse
    dephell_changelogs
    dephell_discover
    dephell_licenses
    dephell_links
    dephell_markers
    dephell_pythons
    dephell_setuptools
    dephell_shells
    dephell_specifier
    dephell_venvs
    dephell_versioning
    fissix
    jinja2
    m2r
    packaging
    pip
    requests
    ruamel_yaml
    tomlkit
    yaspin
  ];

  doCheck = false;

  meta = with lib; {
    description = ''
      Python project management. Manage packages: convert between formats,
      lock, install, resolve, isolate, test, build graph, show outdated, audit.
      Manage venvs, build package, bump version.
    '';
    homepage = "https://github.com/dephell/dephell";
    license = licenses.mit;
    maintainer = with maintainers; [ wiedzmin ];
  };
}
