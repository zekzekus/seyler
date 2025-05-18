test:
	nix run .#ghcid -- -c seyler-test-suite

build:
	nix build

gen-cabal:
	nix run .#gen-cabal

.PHONY:	build test
