module Main (main) where

import Hapio.Internals (
    exportPin,
    unexportPin,
    setDirection,
    setValue,
    getValue,
    Direction(..)
    )
import Control.Concurrent (threadDelay)

main :: IO ()
main = do
    exportPin 17
    setDirection 17 OUT
    setValue 17 1
    setValue 17 0
    unexportPin 17

    main