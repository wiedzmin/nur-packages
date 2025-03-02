{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "groupby";
  version = "unstable";
  homepage = "https://github.com/lostutils/groupby";

  src = fetchFromGitHub {
    owner = "lostutils";
    repo = pname;
    rev = "bd8803081529cd08d3f94898f82052688b4a9248";
    sha256 = "0qnnp07s59vm2f1yf6rp46nfcvx2knazqy8lnqspnndz865984d4";
  };

  cargoHash = "sha256-ilvNpo94orWCsnaUrUeqUSIbyU4oiEGMTyDcH+sb3Qo=";

  # doCheck = false; # `rargs`'s test depends on the deprecated `assert_cli` crate, which in turn is not in Nixpkgs

  meta = with lib; {
    description = "Group lines by a regex";
    homepage = "https://github.com/lostutils/groupby";
    license = licenses.mit;
    maintainers = with maintainers; [ wiedzmin ];
    mainProgram = "groupby";
  };
}
