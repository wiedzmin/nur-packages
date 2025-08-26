{ rustPlatform
, fetchFromGitHub
, libevdev
,
}:
rustPlatform.buildRustPackage rec {
  pname = "xremap";
  version = "v0.10.15";

  src = fetchFromGitHub {
    owner = "xremap";
    repo = "xremap";
    rev = version;
    sha256 = "sha256-6w3sLuGay+WPtQ1MtddvECtwh0U7EQUCDDQxkzYRe5o=";
  };

  buildFeatures = [ "x11" ]; # FIXME: elaborate some features setting logic
  cargoHash = "sha256-FLKR///iMzA0Jff91umWcXA5UAwhA4j5QDOKS7nWlLQ=";

  meta.mainProgram = "xremap";
}
