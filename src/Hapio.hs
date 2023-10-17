module Hapio (
    turnOnFor,
    turnOn,
    turnOff,
) where

import Hapio.Internals
import Control.Concurrent (threadDelay)

turnOnFor :: Int -> Int -> IO ()
turnOnFor pin time = do
    exportPin pin
    setDirection pin OUT
    setValue pin 1
    threadDelay (time * 1000) -- miliseconds to microseconds
    setValue pin 0
    unexportPin pin

turnOn :: Int -> IO ()
turnOn pin = do
    exportPin pin
    setDirection pin OUT
    setValue pin 1

turnOff :: Int -> IO ()
turnOff pin = do
    setValue pin 0
    unexportPin pin