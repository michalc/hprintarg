module Paths_hprintarg (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/Michal/.cabal/bin"
libdir     = "/Users/Michal/.cabal/lib/hprintarg-0.1.0.0/ghc-7.6.3"
datadir    = "/Users/Michal/.cabal/share/hprintarg-0.1.0.0"
libexecdir = "/Users/Michal/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "hprintarg_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hprintarg_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hprintarg_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hprintarg_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
