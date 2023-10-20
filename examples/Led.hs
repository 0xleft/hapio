module Main (main) where

import Hapio
import Control.Concurrent (threadDelay)

main :: IO ()
main = do
    turnOnFor 16 300
    turnOnFor 20 300
    turnOnFor 21 300

    main