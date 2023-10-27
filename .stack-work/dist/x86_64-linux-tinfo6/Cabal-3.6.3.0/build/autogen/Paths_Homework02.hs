{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_Homework02 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/abc/Homework02/.stack-work/install/x86_64-linux-tinfo6/0d5b1e6638b90e2384d76ddf403fd5e445a2b3e5e74b2e40f2f4f9f25d8bfe2e/9.2.8/bin"
libdir     = "/home/abc/Homework02/.stack-work/install/x86_64-linux-tinfo6/0d5b1e6638b90e2384d76ddf403fd5e445a2b3e5e74b2e40f2f4f9f25d8bfe2e/9.2.8/lib/x86_64-linux-ghc-9.2.8/Homework02-0.1.0.0-71R4KCquywWFrD1OiZiukt"
dynlibdir  = "/home/abc/Homework02/.stack-work/install/x86_64-linux-tinfo6/0d5b1e6638b90e2384d76ddf403fd5e445a2b3e5e74b2e40f2f4f9f25d8bfe2e/9.2.8/lib/x86_64-linux-ghc-9.2.8"
datadir    = "/home/abc/Homework02/.stack-work/install/x86_64-linux-tinfo6/0d5b1e6638b90e2384d76ddf403fd5e445a2b3e5e74b2e40f2f4f9f25d8bfe2e/9.2.8/share/x86_64-linux-ghc-9.2.8/Homework02-0.1.0.0"
libexecdir = "/home/abc/Homework02/.stack-work/install/x86_64-linux-tinfo6/0d5b1e6638b90e2384d76ddf403fd5e445a2b3e5e74b2e40f2f4f9f25d8bfe2e/9.2.8/libexec/x86_64-linux-ghc-9.2.8/Homework02-0.1.0.0"
sysconfdir = "/home/abc/Homework02/.stack-work/install/x86_64-linux-tinfo6/0d5b1e6638b90e2384d76ddf403fd5e445a2b3e5e74b2e40f2f4f9f25d8bfe2e/9.2.8/etc"

getBinDir     = catchIO (getEnv "Homework02_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "Homework02_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "Homework02_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "Homework02_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Homework02_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Homework02_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
