{stdenv, rustPlatform, fetchFromGitHub}:

rustPlatform.buildRustPackage rec {
  pname = "rnix-lsp";
  version = "0.1.0";
  src = fetchFromGitHub {
    owner = "nix-community";
    repo = "rnix-lsp";
    rev = "7549dbf5460ee0afc5b4cb5ff96cdd86d014dd37";
    sha256 = "0fy620c34kxl27sd62x9mj0555bcdmnmbsxavmyiwb497z1m9wnn";
  };

  cargoSha256 = "0vcjvgb3hznds94wsglyfsrvfvm7y9p0fdnlaq8p4ryb54hww0xi";
  verifyCargoDeps = true;
}

