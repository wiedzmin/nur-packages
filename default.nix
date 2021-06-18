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

  autoPatchelfHook = pkgs.autoPatchelfHook;
  buildGoModule = pkgs.buildGoModule;
  buildGoPackage = pkgs.buildGoPackage;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  fetchgit = pkgs.fetchgit;
  fetchurl = pkgs.fetchurl;
  git = pkgs.git;
  libX11 = pkgs.xorg.libX11;
  libXft = pkgs.xorg.libXft;
  libXinerama = pkgs.xorg.libXinerama;
  makeWrapper = pkgs.makeWrapper;
  networkmanager = pkgs.networkmanager;
  pcre = pkgs.pcre;
  pkgconfig = pkgs.pkgconfig;
  python3Packages = pkgs.python3Packages;
  sqlite = pkgs.sqlite;
  stdenv = pkgs.stdenv;
  xsel = pkgs.xsel;
  zlib = pkgs.zlib;

  gohack = pkgs.callPackage pkgs/development/tools/gohack/default.nix {
    inherit buildGoPackage fetchgit lib stdenv;
  };
  goimports-reviser = pkgs.callPackage pkgs/development/tools/goimports-reviser/default.nix {
    inherit buildGoPackage fetchgit stdenv;
  };
  go-mod-outdated = pkgs.callPackage pkgs/development/tools/go-mod-outdated/default.nix {
    inherit buildGoPackage fetchgit stdenv;
  };
  redis-tui = pkgs.callPackage pkgs/development/tools/redis-tui/default.nix { lib = mylib; };
  toolbox = pkgs.callPackage pkgs/applications/misc/toolbox/default.nix {
    lib = mylib;
    inherit buildGoModule dmenu-ng fetchFromGitHub git makeWrapper networkmanager xsel;
  };

  bowler = pkgs.callPackage pkgs/development/python-modules/bowler/default.nix {
    lib = mylib;
    inherit fissix moreorless volatile;
  };
  comby = pkgs.callPackage pkgs/development/tools/comby/default.nix {
    lib = mylib;
    inherit autoPatchelfHook fetchurl pcre pkgconfig sqlite stdenv zlib;
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
  dmenu-ng = pkgs.callPackage pkgs/applications/misc/dmenu-ng/default.nix {
    lib = mylib;
    inherit stdenv fetchurl libX11 libXinerama libXft zlib;
  };
  dmenu-python-ng = pkgs.callPackage pkgs/development/python-modules/dmenu-python-ng/default.nix {
    inherit python3Packages stdenv dmenu-ng;
  };
  fissix = pkgs.callPackage pkgs/development/python-modules/fissix/default.nix { lib = mylib; };
  moreorless = pkgs.callPackage pkgs/development/python-modules/moreorless/default.nix { lib = mylib; volatile = volatile; };

  pyfzf = pkgs.callPackage pkgs/development/python-modules/pyfzf/default.nix { lib = mylib; };
  pystdlib = pkgs.callPackage pkgs/development/python-modules/pystdlib/default.nix {
    lib = mylib;
    inherit dmenu-python-ng pyfzf;
  };
  volatile = pkgs.callPackage pkgs/development/python-modules/volatile/default.nix { lib = mylib; };
  yaspin = pkgs.callPackage pkgs/development/python-modules/yaspin/default.nix { lib = mylib; };
  my_cookies = pkgs.callPackage pkgs/development/python-modules/my_cookies/default.nix {
    openssl = pkgs.openssl;
    browser-cookie3 = python3Packages.browser-cookie3;
    inherit python3Packages stdenv;
  };

  firefox-addons = pkgs.recurseIntoAttrs (pkgs.callPackage ./pkgs/firefox-addons { });
}
