module Hapio.Internals (
    isOccupied,
    Direction(..),
    exportPin,
    unexportPin,
    setDirection,
    setValue,
    getValue,
) where

import System.Directory
import Control.Exception (throwIO)
import Data.Char (toLower)

data Direction = OUT | IN deriving (Show, Eq)

-- check if pin is already exported (could be some other program)
isOccupied :: Int -> IO Bool
isOccupied pin = do
    let path = "/sys/class/gpio/gpio" ++ show pin
    doesDirectoryExist path

-- export pin
exportPin :: Int -> IO ()
exportPin pin = do
    occupied <- isOccupied pin
    if occupied
        then throwIO (userError "Pin is already occupied")
        else writeFile "/sys/class/gpio/export" (show pin)

-- unexport pin
unexportPin :: Int -> IO ()
unexportPin pin = do
    writeFile "/sys/class/gpio/unexport" (show pin)

-- set pin direction
setDirection :: Int -> Direction -> IO ()
setDirection pin direction = do
    let path = "/sys/class/gpio/gpio" ++ show pin ++ "/direction"
    -- lowercase direction
    writeFile path (map toLower (show direction))

-- set pin value
setValue :: Int -> Int -> IO ()
setValue pin value = do
    let path = "/sys/class/gpio/gpio" ++ show pin ++ "/value"
    writeFile path (show value)

-- get pin value
getValue :: Int -> IO Int
getValue pin = do
    let path = "/sys/class/gpio/gpio" ++ show pin ++ "/value"
    value <- readFile path
    return (read value :: Int)