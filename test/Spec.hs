import Test.Hspec

import Hapio.Internals(isOccupied, Direction(..))

main :: IO ()
main = hspec $ do
    describe "test is occupied false" $ do
        it "should say false" $ do
            isOccupied 1 `shouldReturn` False

    describe "testing direction constant" $ do
        it "say the directoin in string" $ do
            let direction = OUT
            show direction `shouldBe` "OUT"

    