{-# LANGUAGE DeriveGeneric #-}

module Main where

import Data.Yaml            ( FromJSON
                            , ParseException
                            , decodeFileEither
                            )
import GHC.Generics
import System.Directory     ( getHomeDirectory
                            , setCurrentDirectory
                            )
import System.Posix.Files   ( FileStatus
                            , createSymbolicLink
                            , getSymbolicLinkStatus
                            , isRegularFile
                            , isSymbolicLink
                            , removeLink
                            )
import System.SymbolicLink  ( filePathExist )

main = do
  h <- getHomeDirectory
  setCurrentDirectory h

  d <- decodeFileEither ".ww" :: IO (Either ParseException [LinkPair])

  case d of
    Left e -> putStrLn $ (show e) ++ "\nwu-wei: Who can clear muddy water? Stillness will accomplish this."
    Right lps -> do
      sequence $ [makeLink lp | lp <- lps]
      putStrLn "wu-wei: Clay is shapen to make vessels; the contained space is what is useful."

makeLink :: LinkPair -> IO ()
makeLink lp = do
  x <- filePathExist $ target lp
  if x
    then clobberIfSymbolicLink lp
    else createSymbolicLink (source lp) (target lp)

clobberIfSymbolicLink :: LinkPair -> IO ()
clobberIfSymbolicLink lp = do
  s <- getSymbolicLinkStatus $ target lp
  if isSymbolicLink s
    then do
      removeLink $ target lp
      createSymbolicLink (source lp) (target lp)
    else putStrLn $ "wu-wei: Non-symlink endangers the house of " ++ target lp

data LinkPair = LinkPair {
    source :: FilePath
  , target :: FilePath
} deriving (Generic, Show)

instance FromJSON LinkPair
