{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString.Lazy.Char8 as C8
import           Network.HTTP.Client
import           Network.HTTP.Simple

main :: IO ()
main = do
  putStrLn "hello world"
