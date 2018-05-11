{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString.Lazy.Char8 as C8
import           System.Xattr

--
-- Goal: Get the listed extended attributes from the given `infile`
--       and produce a list of tuples containing their values:
--       [("attribute name", "attribute value")]
--

infile :: FilePath
infile = "Testfile.txt"

whereFrom :: String
whereFrom = "com.apple.metadata:kMDItemWhereFroms"

attrs :: [String]
attrs = [ "com.apple.metadata:kMDItemWhereFroms"    -- Where file was downloaded from
        , "com.apple.metadata:_kMDItemUserTags"     -- File tags
        , "com.apple.metadata:kMDItemFinderComment" -- File comment
        ]

main :: IO ()
main = do
  putStrLn "hello world"

  file <- readFile infile
  print file
