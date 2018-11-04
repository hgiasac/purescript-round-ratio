module Math.Simple.Round where

import Prelude

import Data.Array ((:))
import Data.Array.Partial (head, tail)
import Data.Foldable (sum)
import Data.Int (toNumber)
import Math (pow, round)
import Partial.Unsafe (unsafePartial)

-- | Round and rebalance ratios of array values with fixed point length
-- | To avoid sum of round values isn't correct 100%, for example 
roundRatios :: Array Number -> Number -> Int -> Array Number 
roundRatios [] _ _ = []
roundRatios arr rat fixedLength = runCompute arr 0.0 0.0
  where 
    sumN = sum arr
    denominator = pow 10.0 $ toNumber fixedLength

    runCompute :: Array Number -> Number -> Number -> Array Number
    runCompute [] _ _ = []
    runCompute xs accumulatedValue prevBaseLine =
      newValue : runCompute ((unsafePartial tail) xs) newAcc roundedAcc
      where
        x = unsafePartial head xs
        rawValue = ((*) denominator) $ x / sumN * rat
        newAcc = rawValue + accumulatedValue
        roundedAcc = round newAcc
        newValue = (roundedAcc - prevBaseLine) / denominator

-- | Round and rebalance percents of array values with fixed point length.
-- | A shortcut of roundRatios 
roundPercents :: Array Number -> Int -> Array Number
roundPercents arr fixedLength = roundRatios arr 100.0 fixedLength

