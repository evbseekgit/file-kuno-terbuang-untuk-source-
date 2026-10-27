-- Save as: Recursion.hs
module Recursion where

-- Basic recursion
power :: Int -> Int -> Int
power _ 0 = 1
power base exp = base * power base (exp - 1)

reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- Tail recursion
factorialTail :: Integer -> Integer
factorialTail n = helper n 1
  where
    helper 0 acc = acc
    helper n acc = helper (n - 1) (n * acc)

-- Recursive functions
gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' a b = gcd' b (a `mod` b)

countEvens :: [Int] -> Int
countEvens [] = 0
countEvens (x:xs)
  | even x    = 1 + countEvens xs
  | otherwise = countEvens xs

-- Binary tree recursion
data Tree a = Empty | Node a (Tree a) (Tree a)
  deriving (Show)

treeDepth :: Tree a -> Int
treeDepth Empty = 0
treeDepth (Node _ left right) = 1 + max (treeDepth left) (treeDepth right)

main :: IO ()
main = do
  putStrLn "=== RECURSION ==="
  
  putStrLn "\n1. Basic Recursion:"
  print $ power 2 8
  print $ reverseList [1,2,3,4,5]
  
  putStrLn "\n2. Tail Recursion:"
  print $ factorialTail 5
  print $ factorialTail 10
  
  putStrLn "\n3. Mathematical Recursion:"
  print $ gcd' 48 18
  print $ gcd' 17 13
  
  putStrLn "\n4. List Recursion:"
  print $ countEvens [1..10]
  
  putStrLn "\n5. Tree Recursion:"
  let tree = Node 1 
                (Node 2 
                    (Node 4 Empty Empty) 
                    (Node 5 Empty Empty))
                (Node 3 Empty Empty)
  print tree
  print $ treeDepth tree
  
  putStrLn "\n=== END ==="