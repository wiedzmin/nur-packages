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
}
