{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Ex05 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
version = Version [1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/hamish/src/projects/comp3141/Ex05/.stack-work/install/x86_64-linux-tinfo6/461cda752e85e11eb86dbf7416912933cf196f673068c8a26818b8facee82dbe/8.2.2/bin"
libdir     = "/home/hamish/src/projects/comp3141/Ex05/.stack-work/install/x86_64-linux-tinfo6/461cda752e85e11eb86dbf7416912933cf196f673068c8a26818b8facee82dbe/8.2.2/lib/x86_64-linux-ghc-8.2.2/Ex05-1.0-JXDZC0hFk6z6nEXvnBRiOb-Ex05"
dynlibdir  = "/home/hamish/src/projects/comp3141/Ex05/.stack-work/install/x86_64-linux-tinfo6/461cda752e85e11eb86dbf7416912933cf196f673068c8a26818b8facee82dbe/8.2.2/lib/x86_64-linux-ghc-8.2.2"
datadir    = "/home/hamish/src/projects/comp3141/Ex05/.stack-work/install/x86_64-linux-tinfo6/461cda752e85e11eb86dbf7416912933cf196f673068c8a26818b8facee82dbe/8.2.2/share/x86_64-linux-ghc-8.2.2/Ex05-1.0"
libexecdir = "/home/hamish/src/projects/comp3141/Ex05/.stack-work/install/x86_64-linux-tinfo6/461cda752e85e11eb86dbf7416912933cf196f673068c8a26818b8facee82dbe/8.2.2/libexec/x86_64-linux-ghc-8.2.2/Ex05-1.0"
sysconfdir = "/home/hamish/src/projects/comp3141/Ex05/.stack-work/install/x86_64-linux-tinfo6/461cda752e85e11eb86dbf7416912933cf196f673068c8a26818b8facee82dbe/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Ex05_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Ex05_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Ex05_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Ex05_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Ex05_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Ex05_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
