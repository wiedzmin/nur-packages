{ buildGoPackage, fetchgit, lib }:

buildGoPackage rec {
  name = "gohack-unstable-${version}";
  version = "2019-11-17";
  rev = "03d2ff3646b7ffc380e059413e4302f6cbdeb09b";

  goPackagePath = "github.com/rogpeppe/gohack";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/rogpeppe/gohack";
    sha256 = "1bv9pkzzygpkcnf8ya3j9vyn2h7qnl4qbq6jy9xjpfl46ccg5a7h";
  };

  goDeps = ./deps.nix;

  meta = with lib; {
    description = "Make temporary edits to your Go module dependencies";
    homepage = "https://github.com/rogpeppe/gohack";
    license = licenses.bsd3;
    platforms = platforms.unix;
    maintainers = with maintainers; [ wiedzmin ];
  };
}
