module Test.Main where

import Prelude

import Data.Foldable (sum)
import Effect (Effect)
import Math.Simple.Round (roundPercents)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Rebalance ratios" do

    test "Rebalance ratios" do
      Assert.equal
        100.0
        (sum $ roundPercents [3.0, 3.0, 3.0] 2)
