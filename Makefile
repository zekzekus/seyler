test:
	stack build --fast --haddock-deps --test

build:
	stack build --fast --haddock-deps

ghcid:
	ghcid --command="stack ghci seyler:lib seyler:test:seyler-test-suite" --test="main"

.PHONY:	ghcid build test
