{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString.Lazy.Char8 as C8
import qualified Data.Text as T hiding (empty)
import           Turtle as K
import           System.Xattr
import           Text.XML.HXT.Core
import           Text.HandsomeSoup

--
-- Goal: Get the listed extended attributes from the given `infile`
--       and produce a list of tuples containing their values:
--       [("attribute name", "attribute value")]
--

infile :: T.Text
infile = "Testfile.txt"

whereFrom :: T.Text
whereFrom = "com.apple.metadata:kMDItemWhereFroms"

attrs :: [T.Text]
attrs = [ "com.apple.metadata:kMDItemWhereFroms"    -- Where file was downloaded from
        , "com.apple.metadata:_kMDItemUserTags"     -- File tags
        , "com.apple.metadata:kMDItemFinderComment" -- File comment
        ]

getCmd :: T.Text -> T.Text
getCmd file = "xattr -px "
  <> "com.apple.metadata:kMDItemFinderComment "
  <> file
  <> " | xxd -r -p"
  <> " | plutil -convert xml1 -o - -"

main :: IO ()
main = do
  plist <- strict $ inshell (getCmd infile) empty

  -- Well woop
  print plist

  return $ ()
