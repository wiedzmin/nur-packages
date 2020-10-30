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

  autoreconfHook = pkgs.autoreconfHook;
  bison = pkgs.bison;
  buildGoPackage = pkgs.buildGoPackage;
  doxygen = pkgs.doxygen;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  fetchgit = pkgs.fetchgit;
  flex = pkgs.flex;
  graphviz = pkgs.graphviz;
  pkg-config = pkgs.pkg-config;
  pkgconfig = pkgs.pkgconfig;
  python3Packages = pkgs.python3Packages;
  stdenv = pkgs.stdenv;


  cligen = pkgs.callPackage pkgs/development/libraries/cligen/default.nix {
    inherit bison fetchFromGitHub flex pkg-config stdenv;
  };
  faux = pkgs.callPackage pkgs/development/libraries/faux/default.nix { inherit autoreconfHook fetchgit stdenv; };
  qdbm = pkgs.callPackage pkgs/development/libraries/qdbm/default.nix {
    inherit bison doxygen fetchFromGitHub flex graphviz pkgconfig stdenv;
  };

  gohack = pkgs.callPackage pkgs/development/tools/gohack/default.nix {
    inherit buildGoPackage fetchgit lib stdenv;
  };
  i3lock-color = pkgs.callPackage pkgs/applications/window-managers/i3/lock-color.nix { lib = mylib; };
  redis-tui = pkgs.callPackage pkgs/development/tools/redis-tui/default.nix { lib = mylib; };
  xkeysnail = pkgs.callPackage pkgs/tools/X11/xkeysnail/default.nix {
    lib = mylib;
    inherit python3Packages stdenv;
  };

  bowler = pkgs.callPackage pkgs/development/python-modules/bowler/default.nix {
    lib = mylib;
    inherit fissix moreorless volatile;
  };
  dephell = pkgs.callPackage pkgs/development/python-modules/dephell/default.nix {
    lib = mylib;
    inherit bowler dephell_archive dephell_argparse dephell_changelogs dephell_discover;
    inherit dephell_licenses dephell_links dephell_markers dephell_pythons dephell_setuptools;
    inherit dephell_shells dephell_specifier dephell_venvs dephell_versioning fissix yaspin;
  };
  dephell_archive = pkgs.callPackage pkgs/development/python-modules/dephell_archive/default.nix { lib = mylib; };
  dephell_argparse = pkgs.callPackage pkgs/development/python-modules/dephell_argparse/default.nix { lib = mylib; };
  dephell_changelogs = pkgs.callPackage pkgs/development/python-modules/dephell_changelogs/default.nix { lib = mylib; };
  dephell_discover = pkgs.callPackage pkgs/development/python-modules/dephell_discover/default.nix { lib = mylib; };
  dephell_licenses = pkgs.callPackage pkgs/development/python-modules/dephell_licenses/default.nix { lib = mylib; };
  dephell_links = pkgs.callPackage pkgs/development/python-modules/dephell_links/default.nix { lib = mylib; };
  dephell_markers = pkgs.callPackage pkgs/development/python-modules/dephell_markers/default.nix {
    lib = mylib;
    inherit dephell_specifier;
  };
  dephell_pythons = pkgs.callPackage pkgs/development/python-modules/dephell_pythons/default.nix {
    lib = mylib;
    inherit dephell_specifier;
  };
  dephell_setuptools = pkgs.callPackage pkgs/development/python-modules/dephell_setuptools/default.nix { lib = mylib; };
  dephell_shells = pkgs.callPackage pkgs/development/python-modules/dephell_shells/default.nix { lib = mylib; };
  dephell_specifier = pkgs.callPackage pkgs/development/python-modules/dephell_specifier/default.nix { lib = mylib; };
  dephell_venvs = pkgs.callPackage pkgs/development/python-modules/dephell_venvs/default.nix {
    lib = mylib;
    inherit dephell_pythons;
  };
  dephell_versioning = pkgs.callPackage pkgs/development/python-modules/dephell_versioning/default.nix { lib = mylib; };
  dict-tools = pkgs.callPackage pkgs/development/python-modules/dict-tools/default.nix {
    inherit fetchFromGitHub python3Packages stdenv;
  };
  fissix = pkgs.callPackage pkgs/development/python-modules/fissix/default.nix { lib = mylib; };
  moreorless = pkgs.callPackage pkgs/development/python-modules/moreorless/default.nix { lib = mylib; volatile = volatile; };
  pyfzf = pkgs.callPackage pkgs/development/python-modules/pyfzf/default.nix { lib = mylib; };
  pystdlib = pkgs.callPackage pkgs/development/python-modules/pystdlib/default.nix { lib = mylib; pyfzf = pyfzf; };
  volatile = pkgs.callPackage pkgs/development/python-modules/volatile/default.nix { lib = mylib; };
  yaspin = pkgs.callPackage pkgs/development/python-modules/yaspin/default.nix { lib = mylib; };
}
