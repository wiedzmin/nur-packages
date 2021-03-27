{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "thumbs";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "fcsonline";
    repo = "tmux-thumbs";
    rev = "403be0fd1d57299ae2ea86b40c2c481c11052b8d";
    sha256 = "0lack8x54ic52sj8wjg7ybwirs9m5zkxlqg7y22qmih9nsraskxd";
    fetchSubmodules = true;
  };
  cargoSha256 = "sha256-mC3PZlbCz6Q0EIJ+joRmwcs/MtxZKdXhiyRG4nU0OwM=";
}
