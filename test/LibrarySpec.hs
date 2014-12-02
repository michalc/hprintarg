{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

import Library
import Test.Hspec
import Control.Monad.State

data MockArgsAndResult = MockArgsAndResult [String] String
  deriving(Eq, Show)

instance SystemMonad (State MockArgsAndResult) where 
    getArgs = do 
      MockArgsAndResult args _ <- get
      return args
    putStrLn string = do
      MockArgsAndResult args _ <- get
      put $ MockArgsAndResult args string
      return ()

main :: IO ()
main = hspec $ do
  describe "run" $ do
    it "passes the first command line argument to putStrLn" $ do
      (execState run (MockArgsAndResult ["first", "second"] "")) `shouldBe` (MockArgsAndResult ["first", "second"] "first")
