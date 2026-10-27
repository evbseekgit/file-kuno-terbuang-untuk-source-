-- Save as: Fundamental.hs
module Fundamental where

-- Pattern Matching
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

getFirst :: (a, b) -> a
getFirst (x, y) = x

-- Guard Expressions
grade :: Int -> String
grade score
  | score >= 90 = "A"
  | score >= 80 = "B"
  | score >= 70 = "C"
  | score >= 60 = "D"
  | otherwise   = "F"

-- Let vs Where
calculate :: Float -> Float -> Float
calculate x y = 
  let a = x * 2
      b = y * 3
  in (a + b) / 2

calculate2 :: Float -> Float -> Float
calculate2 x y = (a + b) / 2
  where
    a = x * 2
    b = y * 3

-- Operators
exampleOps :: [Int]
exampleOps = 0 : [1,2,3] ++ [4,5,6]

-- Function composition
add1 :: Int -> Int
add1 x = x + 1
mult2 :: Int -> Int
mult2 x = x * 2
composed :: Int -> Int
composed = mult2 . add1

-- Main untuk testing
main :: IO ()
main = do
  putStrLn "=== FUNDAMENTAL HASKELL SYNTAX ==="
  
  putStrLn "\n1. Pattern Matching:"
  print $ factorial 5
  print $ sumList [1,2,3,4,5]
  print $ getFirst ("Hello", 42)
  
  putStrLn "\n2. Guard Expressions:"
  putStrLn $ grade 85
  putStrLn $ grade 55
  
  putStrLn "\n3. Let vs Where:"
  print $ calculate 10 20
  print $ calculate2 10 20
  
  putStrLn "\n4. Operators & Composition:"
  print exampleOps
  print $ composed 5
  
  putStrLn "\n=== END ==="