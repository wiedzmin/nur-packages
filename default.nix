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
in
rec {
  # The `lib`, `modules`, and `overlay` names are special
  lib = (import ./lib { inherit pkgs; }) // { maintainers = maintainers; }; # functions
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
  makeBinPath = pkgs.lib.makeBinPath;
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
  redis-tui = pkgs.callPackage pkgs/development/tools/redis-tui/default.nix { inherit lib; };
  toolbox = pkgs.callPackage pkgs/applications/misc/toolbox/default.nix {
    inherit buildGoModule dmenu-ng fetchFromGitHub git lib makeBinPath makeWrapper networkmanager stdenv xsel;
  };

  bowler = pkgs.callPackage pkgs/development/python-modules/bowler/default.nix {
    inherit fissix lib moreorless volatile;
  };
  comby = pkgs.callPackage pkgs/development/tools/comby/default.nix {
    inherit autoPatchelfHook fetchurl lib pcre pkgconfig sqlite stdenv zlib;
  };
  dephell = pkgs.callPackage pkgs/development/python-modules/dephell/default.nix {
    inherit lib;
    inherit bowler dephell_archive dephell_argparse dephell_changelogs dephell_discover;
    inherit dephell_licenses dephell_links dephell_markers dephell_pythons dephell_setuptools;
    inherit dephell_shells dephell_specifier dephell_venvs dephell_versioning fissix yaspin;
  };
  dephell_archive = pkgs.callPackage pkgs/development/python-modules/dephell_archive/default.nix { inherit lib; };
  dephell_argparse = pkgs.callPackage pkgs/development/python-modules/dephell_argparse/default.nix { inherit lib; };
  dephell_changelogs = pkgs.callPackage pkgs/development/python-modules/dephell_changelogs/default.nix { inherit lib; };
  dephell_discover = pkgs.callPackage pkgs/development/python-modules/dephell_discover/default.nix { inherit lib; };
  dephell_licenses = pkgs.callPackage pkgs/development/python-modules/dephell_licenses/default.nix { inherit lib; };
  dephell_links = pkgs.callPackage pkgs/development/python-modules/dephell_links/default.nix { inherit lib; };
  dephell_markers = pkgs.callPackage pkgs/development/python-modules/dephell_markers/default.nix {
    inherit dephell_specifier lib;
  };
  dephell_pythons = pkgs.callPackage pkgs/development/python-modules/dephell_pythons/default.nix {
    inherit dephell_specifier lib;
  };
  dephell_setuptools = pkgs.callPackage pkgs/development/python-modules/dephell_setuptools/default.nix { inherit lib; };
  dephell_shells = pkgs.callPackage pkgs/development/python-modules/dephell_shells/default.nix { inherit lib; };
  dephell_specifier = pkgs.callPackage pkgs/development/python-modules/dephell_specifier/default.nix { inherit lib; };
  dephell_venvs = pkgs.callPackage pkgs/development/python-modules/dephell_venvs/default.nix {
    inherit dephell_pythons lib;
  };
  dephell_versioning = pkgs.callPackage pkgs/development/python-modules/dephell_versioning/default.nix { inherit lib; };
  dmenu-ng = pkgs.callPackage pkgs/applications/misc/dmenu-ng/default.nix {
    inherit fetchurl lib libX11 libXft libXinerama stdenv zlib;
  };
  dmenu-python-ng = pkgs.callPackage pkgs/development/python-modules/dmenu-python-ng/default.nix {
    inherit python3Packages stdenv dmenu-ng;
  };
  fissix = pkgs.callPackage pkgs/development/python-modules/fissix/default.nix { inherit lib; };
  moreorless = pkgs.callPackage pkgs/development/python-modules/moreorless/default.nix { inherit lib; volatile = volatile; };

  pyfzf = pkgs.callPackage pkgs/development/python-modules/pyfzf/default.nix { inherit lib; };
  pystdlib = pkgs.callPackage pkgs/development/python-modules/pystdlib/default.nix {
    inherit dmenu-python-ng lib pyfzf;
  };
  volatile = pkgs.callPackage pkgs/development/python-modules/volatile/default.nix { inherit lib; };
  yaspin = pkgs.callPackage pkgs/development/python-modules/yaspin/default.nix { inherit lib; };
  my_cookies = pkgs.callPackage pkgs/development/python-modules/my_cookies/default.nix {
    openssl = pkgs.openssl;
    browser-cookie3 = python3Packages.browser-cookie3;
    inherit python3Packages stdenv;
  };

  firefox-addons = pkgs.recurseIntoAttrs (pkgs.callPackage ./pkgs/firefox-addons { });
}
