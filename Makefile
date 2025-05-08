test:
	nix run .#ghcid -- -c seyler-test-suite

build:
	nix build

.PHONY:	build test
