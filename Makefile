ghcid:
	ghcid --command="stack ghci seyler:lib seyler:test:seyler-test-suite" --test="main"

build:
	stack build --fast --haddock-deps

test:
	stack build --fast --haddock-deps --test

.PHONY:	ghcid build test
