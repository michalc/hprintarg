module Library where

import System.Environment (getArgs)

run :: IO ()
run = do
  args <- getArgs 
  putStrLn $ head args
