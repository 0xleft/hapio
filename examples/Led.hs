module Main (main) where

import Hapio
import Control.Concurrent (threadDelay)

main :: IO ()
main = do
    turnOnFor 12 1000
    turnOnFor 11 1000

    main