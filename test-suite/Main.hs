import           Lib.Prelude

-- Tasty makes it easy to test your code. It is a test framework that can
-- combine many different types of tests into one suite. See its website for
-- help: <http://documentup.com/feuerbach/tasty>.
import qualified Test.Tasty

-- Hspec is one of the providers for Tasty. It provides a nice syntax for
-- writing tests. Its website has more info: <https://hspec.github.io>.
import           Test.Tasty.Hspec

import           Seyler

main :: IO ()
main = do
  test <- testSpec "seyler" spec
  Test.Tasty.defaultMain test

spec :: Spec
spec = parallel $ do
  it "command to url" $ do
    toCommandURL (Command Add [("a", "b")]) `shouldBe` "things:///add?a=b"
    toCommandURL (Command Add [("a", "b b b")])
      `shouldBe` "things:///add?a=b%20b%20b"
    toCommandURL (Command Update [("a", "b"), ("c", "d")])
      `shouldBe` "things:///update?a=b&c=d"
    toCommandURL (Command Add []) `shouldBe` "things:///add?"
    toCommandURL (Command AddProject [("a", "b"), ("c", "d")])
      `shouldBe` "things:///add-project?a=b&c=d"
  it "command to command to run" $ do
    toCommand (Command Add [("a", "b")]) `shouldBe` "open things:///add?a=b"
    toCommand (Command AddProject [("a", "b"), ("c", "d")])
      `shouldBe` "open things:///add-project?a=b&c=d"
