## Module Math.Round

#### `roundRatios`

``` purescript
roundRatios :: Array Number -> Number -> Int -> Array Number
```

Round and rebalance ratios of array values with fixed point length
To avoid sum of round values isn't correct 100%, for example 

#### `roundPercents`

``` purescript
roundPercents :: Array Number -> Int -> Array Number
```

Round and rebalance percents of array values with fixed point length.
A shortcut of roundRatios 


