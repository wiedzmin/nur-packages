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
  autoreconfHook = pkgs.autoreconfHook;
  bison = pkgs.bison;
  buildGoModule = pkgs.buildGoModule;
  buildGoPackage = pkgs.buildGoPackage;
  doxygen = pkgs.doxygen;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  fetchgit = pkgs.fetchgit;
  fetchurl = pkgs.fetchurl;
  flex = pkgs.flex;
  git = pkgs.git;
  graphviz = pkgs.graphviz;
  libX11 = pkgs.xorg.libX11;
  libXft = pkgs.xorg.libXft;
  libXinerama = pkgs.xorg.libXinerama;
  locale = pkgs.locale;
  makeWrapper = pkgs.makeWrapper;
  networkmanager = pkgs.networkmanager;
  pcre = pkgs.pcre;
  pkg-config = pkgs.pkg-config;
  pkgconfig = pkgs.pkgconfig;
  python3Packages = pkgs.python3Packages;
  rofi = pkgs.rofi;
  rustPlatform = pkgs.rustPlatform;
  sqlite = pkgs.sqlite;
  stdenv = pkgs.stdenv;
  substituteAll = pkgs.substituteAll;
  xsel = pkgs.xsel;
  zlib = pkgs.zlib;

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
  goimports-reviser = pkgs.callPackage pkgs/development/tools/goimports-reviser/default.nix {
    inherit buildGoPackage fetchgit stdenv;
  };
  go-mod-outdated = pkgs.callPackage pkgs/development/tools/go-mod-outdated/default.nix {
    inherit buildGoPackage fetchgit stdenv;
  };
  i3lock-color = pkgs.callPackage pkgs/applications/window-managers/i3/lock-color.nix { lib = mylib; };
  redis-tui = pkgs.callPackage pkgs/development/tools/redis-tui/default.nix { lib = mylib; };
  xkeysnail = pkgs.callPackage pkgs/tools/X11/xkeysnail/default.nix {
    lib = mylib;
    inherit python3Packages stdenv;
  };
  thumbs = pkgs.callPackage pkgs/applications/misc/thumbs/default.nix {
    lib = mylib;
    inherit rustPlatform fetchFromGitHub;
  };
  toolbox = pkgs.callPackage pkgs/applications/misc/toolbox/default.nix {
    lib = mylib;
    inherit buildGoModule dmenu-ng fetchFromGitHub git makeWrapper networkmanager xsel;
  };

  apply-defaults = pkgs.callPackage pkgs/development/python-modules/apply-defaults/default.nix {
    inherit python3Packages stdenv;
  };
  bowler = pkgs.callPackage pkgs/development/python-modules/bowler/default.nix {
    lib = mylib;
    inherit fissix moreorless volatile;
  };
  click6 = pkgs.callPackage pkgs/development/python-modules/click6/default.nix {
    inherit locale python3Packages stdenv substituteAll;
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
  dict-tools = pkgs.callPackage pkgs/development/python-modules/dict-tools/default.nix {
    inherit fetchFromGitHub python3Packages stdenv;
  };
  django-choices = pkgs.callPackage pkgs/development/python-modules/django-choices/default.nix {
    inherit python3Packages stdenv;
  };
  django-debug-toolbar = pkgs.callPackage pkgs/development/python-modules/django-debug-toolbar/default.nix {
    inherit python3Packages stdenv;
  };
  django-epiced = pkgs.callPackage pkgs/development/python-modules/django-epiced/default.nix {
    inherit python3Packages stdenv;
  };
  django-filer = pkgs.callPackage pkgs/development/python-modules/django-filer/default.nix {
    inherit fetchFromGitHub python3Packages stdenv; # django-js-asset django-mptt
  };
  django-js-asset = pkgs.callPackage pkgs/development/python-modules/django-js-asset/default.nix {
    inherit python3Packages stdenv;
  };
  django-modern-rpc = pkgs.callPackage pkgs/development/python-modules/django-modern-rpc/default.nix {
    inherit python3Packages stdenv;
  };
  django-mptt = pkgs.callPackage pkgs/development/python-modules/django-mptt/default.nix {
    inherit python3Packages stdenv django-js-asset;
  };
  django-related-select = pkgs.callPackage pkgs/development/python-modules/django-related-select/default.nix {
    inherit python3Packages stdenv;
  };
  dmenu-ng = pkgs.callPackage pkgs/applications/misc/dmenu-ng/default.nix {
    lib = mylib;
    inherit stdenv fetchurl libX11 libXinerama libXft zlib;
  };
  dmenu-python-ng = pkgs.callPackage pkgs/development/python-modules/dmenu-python-ng/default.nix {
    inherit python3Packages stdenv dmenu-ng;
  };
  drest = pkgs.callPackage pkgs/development/python-modules/drest/default.nix { inherit python3Packages stdenv; };
  fissix = pkgs.callPackage pkgs/development/python-modules/fissix/default.nix { lib = mylib; };
  json-rpc = pkgs.callPackage pkgs/development/python-modules/json-rpc/default.nix { inherit python3Packages stdenv; };
  jsonfield = pkgs.callPackage pkgs/development/python-modules/jsonfield/default.nix { inherit python3Packages stdenv; };
  jsonrpcclient = pkgs.callPackage pkgs/development/python-modules/jsonrpcclient/default.nix {
    inherit python3Packages stdenv apply-defaults click6;
  };
  moreorless = pkgs.callPackage pkgs/development/python-modules/moreorless/default.nix { lib = mylib; volatile = volatile; };
  python-social-auth = pkgs.callPackage pkgs/development/python-modules/python-social-auth/default.nix {
    lib = mylib;
    inherit python3Packages stdenv volatile social-auth-core;
  };

  pyfzf = pkgs.callPackage pkgs/development/python-modules/pyfzf/default.nix { lib = mylib; };
  pystdlib = pkgs.callPackage pkgs/development/python-modules/pystdlib/default.nix {
    lib = mylib;
    inherit dmenu-python-ng pyfzf;
  };
  social-auth-app-django = pkgs.callPackage pkgs/development/python-modules/social-auth-app-django/default.nix {
    inherit python3Packages stdenv social-auth-core;
  };
  social-auth-core = pkgs.callPackage pkgs/development/python-modules/social-auth-app-django/default.nix {
    inherit python3Packages stdenv;
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
