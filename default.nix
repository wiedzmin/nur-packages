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
  lib = pkgs.lib // { maintainers = maintainers; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  autoPatchelfHook = pkgs.autoPatchelfHook;
  autoreconfHook = pkgs.autoreconfHook;
  bison = pkgs.bison;
  buildGoModule = pkgs.buildGoModule;
  buildGoPackage = pkgs.buildGoPackage;
  cmake = pkgs.cmake;
  dbus = pkgs.dbus;
  extra-cmake-modules = pkgs.extra-cmake-modules;
  fd = pkgs.fd;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  fetchgit = pkgs.fetchgit;
  fetchurl = pkgs.fetchurl;
  flex = pkgs.flex;
  git = pkgs.git;
  libX11 = pkgs.xorg.libX11;
  libXft = pkgs.xorg.libXft;
  libXi = pkgs.xorg.libXi;
  libXinerama = pkgs.xorg.libXinerama;
  libXtst = pkgs.xorg.libXtst;
  libxkbcommon = pkgs.libxkbcommon;
  libnotify = pkgs.libnotify;
  libtool = pkgs.libtool;
  luaPackages = pkgs.luaPackages;
  makeBinPath = pkgs.lib.makeBinPath;
  makeWrapper = pkgs.makeWrapper;
  networkmanager = pkgs.networkmanager;
  nghttp2 = pkgs.nghttp2;
  openssl = pkgs.openssl;
  pcre = pkgs.pcre;
  pkg-config = pkgs.pkg-config;
  pkgconfig = pkgs.pkgconfig;
  python3Packages = pkgs.python3Packages;
  rofi = pkgs.rofi;
  systemd = pkgs.systemd;
  tmux = pkgs.tmux;
  tmuxp = pkgs.tmuxp;
  rustPlatform = pkgs.rustPlatform;
  sqlite = pkgs.sqlite;
  stdenv = pkgs.stdenv;
  wxGTK31 = pkgs.wxGTK31;
  xclip = pkgs.xclip;
  xdotool = pkgs.xdotool;
  xkb-switch = pkgs.xkb-switch;
  xsel = pkgs.xsel;
  zlib = pkgs.zlib;

  cargs = pkgs.callPackage pkgs/development/libraries/cargs/default.nix {
    inherit cmake fetchFromGitHub lib stdenv;
  };
  cligen = pkgs.callPackage pkgs/development/libraries/cligen/default.nix {
    inherit bison fetchFromGitHub flex lib pkg-config stdenv;
  };
  cligen5 = pkgs.callPackage pkgs/development/libraries/cligen5/default.nix {
    inherit bison fetchFromGitHub flex lib pkg-config stdenv;
  };
  clixon5 = pkgs.callPackage pkgs/development/libraries/clixon5/default.nix {
    inherit bison fetchFromGitHub flex lib pkg-config stdenv cligen openssl nghttp2 autoreconfHook;
  };
  clixon = pkgs.callPackage pkgs/development/libraries/clixon/default.nix {
    inherit autoreconfHook bison cligen fetchFromGitHub flex lib libtool nghttp2 openssl pkg-config stdenv;
  };
  cwalk = pkgs.callPackage pkgs/development/libraries/cwalk/default.nix {
    inherit cmake fetchFromGitHub lib stdenv;
  };

  gohack = pkgs.callPackage pkgs/development/tools/gohack/default.nix {
    inherit buildGoPackage fetchgit lib;
  };
  goimports-reviser = pkgs.callPackage pkgs/development/tools/goimports-reviser/default.nix {
    inherit buildGoPackage fetchgit lib;
  };
  go-mod-outdated = pkgs.callPackage pkgs/development/tools/go-mod-outdated/default.nix {
    inherit buildGoPackage fetchgit lib; # FIXME: do we need anything except `lib` here?
  };

  comby = pkgs.callPackage pkgs/development/tools/comby/default.nix {
    inherit autoPatchelfHook fetchurl lib pcre pkgconfig sqlite stdenv zlib;
  };
  redis-tui = pkgs.callPackage pkgs/development/tools/redis-tui/default.nix { inherit lib; };

  wmtools = pkgs.callPackage pkgs/applications/misc/wmtools/default.nix {
    inherit buildGoModule fetchFromGitHub lib makeWrapper xdotool xkb-switch;
  };
  toolbox = pkgs.callPackage pkgs/applications/misc/toolbox/default.nix {
    inherit buildGoModule fd fetchFromGitHub git lib makeWrapper networkmanager rofi systemd tmux tmuxp xkb-switch xsel;
  };

  bowler = pkgs.callPackage pkgs/development/python-modules/bowler/default.nix {
    inherit fissix lib moreorless python3Packages volatile;
  };
  dephell = pkgs.callPackage pkgs/development/python-modules/dephell/default.nix {
    inherit bowler fissix lib yaspin;
    inherit dephell_archive dephell_argparse dephell_changelogs dephell_discover;
    inherit dephell_licenses dephell_links dephell_markers dephell_pythons;
    inherit dephell_setuptools dephell_shells dephell_specifier dephell_venvs dephell_versioning;
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
    inherit dmenu-ng lib python3Packages;
  };
  fissix = pkgs.callPackage pkgs/development/python-modules/fissix/default.nix { inherit lib; };
  moreorless = pkgs.callPackage pkgs/development/python-modules/moreorless/default.nix {
    inherit lib;
    volatile = volatile;
  };

  pystdlib = pkgs.callPackage pkgs/development/python-modules/pystdlib/default.nix {
    inherit dmenu-python-ng lib;
  };
  volatile = pkgs.callPackage pkgs/development/python-modules/volatile/default.nix { inherit lib; };
  yaspin = pkgs.callPackage pkgs/development/python-modules/yaspin/default.nix { inherit lib; };
  my_cookies = pkgs.callPackage pkgs/development/python-modules/my_cookies/default.nix {
    inherit lib openssl python3Packages;
  };

  awesome-lain = pkgs.callPackage pkgs/development/lua-modules/awesome-lain/default.nix { inherit lib; };
  awesome-ezconfig = pkgs.callPackage pkgs/development/lua-modules/awesome-ezconfig/default.nix { inherit lib; };
  awesome-hints = pkgs.callPackage pkgs/development/lua-modules/awesome-hints/default.nix { inherit lib; };

  firefox-addons = pkgs.recurseIntoAttrs (pkgs.callPackage ./pkgs/firefox-addons { inherit lib; });

  xremap = pkgs.callPackage pkgs/applications/misc/xremap/default.nix {
    inherit fetchFromGitHub rustPlatform;
  };
}
