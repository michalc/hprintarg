module Library where

import System.Environment (getArgs)

class Monad m => SystemMonad m where
  getArgs :: m [String]
  putStrLn :: String -> m ()

instance SystemMonad IO where
  getArgs = System.Environment.getArgs
  putStrLn = Prelude.putStrLn

run :: SystemMonad m => m ()
run = do
  args <- Library.getArgs
  Library.putStrLn $ head args
