{ stdenv, fetchFromGitHub
, python-with-packages 
, automake, autoconf, libtool
, pkgconfig, bash, autoreconfHook
, ocaml, ocamlPackages
, z3, yices, cvc4  }:
stdenv.mkDerivation {
  name = "kind2";
  src =  fetchFromGitHub {
    owner = "kind2-mc";
    repo = "kind2";
    rev = "96773521641cef2a7962630ff9d11074e38e778a";
    sha256 = "19s7haxzc8ymlqcvxj8rnm6x9nk5c1161ya1c9s2a3rzwq56ammx";
  };
  patches = [ 
    ./czmq-configure.patch
   ./libczmq-configure.patch 
  ];
  preAutoreconf = ''
	patchShebangs ./autogen.sh
	patchShebangs ./ocamlczmq/autogen.sh
	patchShebangs ./ocamlczmq/czmq/version.sh
	patchShebangs ./build.sh
	patchShebangs ./ocamlczmq/build.sh
  '';
  autoreconfPhase = ''
   	runHook preAutoreconf
   	sh ./autogen.sh
  '';
  buildPhase = ''
 	mkdir $out
    export CFLAGS="-Wno-format-security"
    ./build.sh --prefix=$out
  
  '';
  nativeBuildInputs = [
    pkgconfig
    libtool
    autoconf
    automake
    autoreconfHook
  ];
  buildInputs = [
    ocaml
    ocamlPackages.findlib
    ocamlPackages.ocamlbuild
    ocamlPackages.menhir
    ocamlPackages.num
    ocamlPackages.yojson
    z3
    yices
    cvc4
    python-with-packages
  ];

}



