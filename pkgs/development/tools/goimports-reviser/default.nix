# This file was generated by https://github.com/kamilchm/go2nix v1.3.0
{ buildGoPackage, fetchgit, lib }:

buildGoPackage rec {
  name = "goimports-reviser-unstable-${version}";
  version = "2021-01-04";
  rev = "f8572aed2946e10878a167c8250600646e3c7601";

  goPackagePath = "github.com/incu6us/goimports-reviser";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/incu6us/goimports-reviser";
    sha256 = "1nkrvslhsj3rsnjw4j8g1l78pkrpndmymf22ggq7lwkr4jrypxa9";
  };

  goDeps = ./deps.nix;

  meta = with lib; {
    description = "Right imports sorting & code formatting tool (goimports alternative)";
    homepage = "https://github.com/incu6us/goimports-reviser";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ wiedzmin ];
    broken = true;
  };
}
