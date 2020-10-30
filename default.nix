# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> {} }:

let
  maintainers = pkgs.lib.maintainers // import ./maintainers.nix;
  mylib = pkgs.lib // { maintainers = maintainers; };
in
rec {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  xkeysnail = pkgs.callPackage pkgs/tools/X11/xkeysnail/default.nix {
    lib = mylib; python3Packages = pkgs.python3Packages; stdenv = pkgs.stdenv; };
  pyfzf = pkgs.callPackage pkgs/development/python-modules/pyfzf/default.nix { lib = mylib; };
  pystdlib = pkgs.callPackage pkgs/development/python-modules/pystdlib/default.nix { lib = mylib; pyfzf = pyfzf; };
  i3lock-color = pkgs.callPackage pkgs/applications/window-managers/i3/lock-color.nix { lib = mylib; };
  redis-tui = pkgs.callPackage pkgs/development/tools/redis-tui/default.nix { lib = mylib; };
  gohack = pkgs.callPackage pkgs/development/tools/gohack/default.nix {
    buildGoPackage = pkgs.buildGoPackage;
    fetchgit = pkgs.fetchgit;
    lib = mylib;
    stdenv = pkgs.stdenv;
  };

  faux = pkgs.callPackage pkgs/development/libraries/faux/default.nix {
    autoreconfHook = pkgs.autoreconfHook;
    fetchgit = pkgs.fetchgit;
    stdenv = pkgs.stdenv;
  };

  dephell_archive = pkgs.callPackage pkgs/development/python-modules/dephell_archive/default.nix { lib = mylib; };
  dephell_argparse = pkgs.callPackage pkgs/development/python-modules/dephell_argparse/default.nix { lib = mylib; };
  dephell_changelogs = pkgs.callPackage pkgs/development/python-modules/dephell_changelogs/default.nix { lib = mylib; };
  dephell_discover = pkgs.callPackage pkgs/development/python-modules/dephell_discover/default.nix { lib = mylib; };
  dephell_licenses = pkgs.callPackage pkgs/development/python-modules/dephell_licenses/default.nix { lib = mylib; };
  dephell_links = pkgs.callPackage pkgs/development/python-modules/dephell_links/default.nix { lib = mylib; };
  dephell_markers = pkgs.callPackage pkgs/development/python-modules/dephell_markers/default.nix {
    dephell_specifier = dephell_specifier;
    lib = mylib;
  };
  dephell_pythons = pkgs.callPackage pkgs/development/python-modules/dephell_pythons/default.nix {
    dephell_specifier = dephell_specifier;
    lib = mylib;
  };
  dephell_setuptools = pkgs.callPackage pkgs/development/python-modules/dephell_setuptools/default.nix { lib = mylib; };
  dephell_shells = pkgs.callPackage pkgs/development/python-modules/dephell_shells/default.nix { lib = mylib; };
  dephell_specifier = pkgs.callPackage pkgs/development/python-modules/dephell_specifier/default.nix { lib = mylib; };
  dephell_venvs = pkgs.callPackage pkgs/development/python-modules/dephell_venvs/default.nix {
    dephell_pythons = dephell_pythons;
    lib = mylib;
  };
  dephell_versioning = pkgs.callPackage pkgs/development/python-modules/dephell_versioning/default.nix { lib = mylib; };
  dephell = pkgs.callPackage pkgs/development/python-modules/dephell/default.nix {
    bowler = bowler;
    dephell_archive = dephell_archive;
    dephell_argparse = dephell_argparse;
    dephell_changelogs = dephell_changelogs;
    dephell_discover = dephell_discover;
    dephell_licenses = dephell_licenses;
    dephell_links = dephell_links;
    dephell_markers = dephell_markers;
    dephell_pythons = dephell_pythons;
    dephell_setuptools = dephell_setuptools;
    dephell_shells = dephell_shells;
    dephell_specifier = dephell_specifier;
    dephell_venvs = dephell_venvs;
    dephell_versioning = dephell_versioning;
    fissix = fissix;
    lib = mylib;
    yaspin = yaspin;
  };
  fissix = pkgs.callPackage pkgs/development/python-modules/fissix/default.nix { lib = mylib; };
  volatile = pkgs.callPackage pkgs/development/python-modules/volatile/default.nix { lib = mylib; };
  moreorless = pkgs.callPackage pkgs/development/python-modules/moreorless/default.nix {
    lib = mylib;
    volatile = volatile;
  };
  bowler = pkgs.callPackage pkgs/development/python-modules/bowler/default.nix {
    fissix = fissix;
    lib = mylib;
    moreorless = moreorless;
    volatile = volatile;
  };
  yaspin = pkgs.callPackage pkgs/development/python-modules/yaspin/default.nix { lib = mylib; };
}
