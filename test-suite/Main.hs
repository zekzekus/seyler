import Lib.Prelude
-- Tasty makes it easy to test your code. It is a test framework that can
-- combine many different types of tests into one suite. See its website for
-- help: <http://documentup.com/feuerbach/tasty>.

-- Hspec is one of the providers for Tasty. It provides a nice syntax for
-- writing tests. Its website has more info: <https://hspec.github.io>.

import Seyler
import Test.Hspec
import qualified Test.Tasty
import Test.Tasty.Hspec

main :: IO ()
main = do
  test <- testSpec "seyler" spec
  Test.Tasty.defaultMain test

spec :: Spec
spec = parallel $ do
  it "command to url" $ do
    shouldBe (toCommandURL (Command Add [("a", "b")])) "things:///add?a=b"
    shouldBe
      (toCommandURL (Command Add [("a", "b b b")]))
      "things:///add?a=b%20b%20b"
    shouldBe
      (toCommandURL (Command Update [("a", "b"), ("c", "d")]))
      "things:///update?a=b&c=d"
    shouldBe (toCommandURL (Command Add [])) "things:///add?"
    shouldBe
      (toCommandURL (Command AddProject [("a", "b"), ("c", "d")]))
      "things:///add-project?a=b&c=d"
  it "command to command to run" $ do
    shouldBe (toCommand (Command Add [("a", "b")])) "open things:///add?a=b"
    shouldBe
      (toCommand (Command AddProject [("a", "b"), ("c", "d")]))
      "open things:///add-project?a=b&c=d"
