{
  description = "A Haskell project";
  inputs.hix.url = "github:tek/hix?ref=0.9.1";
  outputs = {hix, ...}: hix.lib.flake {
    packages = {
      seyler = {
        src = builtins.path { path = ./.; name = "source"; };
        description = "Command line interface for Things productivitiy app";
        cabal = {
          author = "Zekeriya Koc";
          build-type = "Simple";
          copyright = "2025 Zekeriya Koc";
          license = "MIT";
          version = "0.0.0";
          meta = {
            maintainer = "Zekeriya Koc";
            homepage = "https://github.com/zekzekus/seyler#readme";
            synopsis = "Command line interface for Things productivitiy app";
          };
        };
        library = {
          enable = true;
          dependencies = [
            "process"
            "protolude"
            "text"
            "uri-encode"
          ];
          default-extensions = [
            "OverloadedStrings"
            "NoImplicitPrelude"
          ];
          source-dirs = "library";
          language = "Haskell2010";
          ghc-options = [
            "-Wall"
            "-Wcompat"
            "-Wincomplete-record-updates"
            "-Wincomplete-uni-patterns"
            "-Wredundant-constraints"
          ];
          component = {
            other-modules = [
              "Paths_seyler"
            ];
          };
        };
        executables.seyler = {
          dependencies = [
            "process"
            "protolude"
            "seyler"
            "text"
            "uri-encode"
          ];
          default-extensions = [
            "OverloadedStrings"
            "NoImplicitPrelude"
          ];
          source-dirs = "executable";
          language = "Haskell2010";
          ghc-options = [
            "-Wall"
            "-Wcompat"
            "-Wincomplete-record-updates"
            "-Wincomplete-uni-patterns"
            "-Wredundant-constraints"
          ];
          component = {
            other-modules = [
              "Paths_seyler"
            ];
          };
        };
        tests.seyler-test-suite = {
          dependencies = [
            "hspec"
            "process"
            "protolude"
            "seyler"
            "tasty"
            "tasty-hspec"
            "text"
            "uri-encode"
          ];
          default-extensions = [
            "OverloadedStrings"
            "NoImplicitPrelude"
          ];
          source-dirs = "test-suite";
          language = "Haskell2010";
          ghc-options = [
            "-Wall"
            "-Wcompat"
            "-Wincomplete-record-updates"
            "-Wincomplete-uni-patterns"
            "-Wredundant-constraints"
          ];
          component = {
            other-modules = [
              "Paths_seyler"
            ];
          };
        };
      };
    };
  };
}
