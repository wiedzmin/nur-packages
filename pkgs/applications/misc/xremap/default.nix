{ rustPlatform
, fetchFromGitHub
, libevdev
,
}:
rustPlatform.buildRustPackage rec {
  pname = "xremap";
  version = "v0.10.3";

  src = fetchFromGitHub {
    owner = "k0kubun";
    repo = "xremap";
    rev = version;
    sha256 = "sha256-6w3sLuGay+WPtQ1MtddvECtwh0U7EQUCDDQxkzYRe5o=";
  };

  buildFeatures = [ "x11" ]; # FIXME: elaborate some features setting logic
  cargoHash = "sha256-CitrCG56uB/y3g2y2KxC3czsNq7B9FjFrLjQZItw2wk=";

  meta.mainProgram = "xremap";
}
