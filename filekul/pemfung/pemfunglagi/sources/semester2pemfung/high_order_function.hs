-- Save as: HigherOrder.hs
module HigherOrder where

-- Manual implementations
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x       = x : filter' p xs
  | otherwise = filter' p xs

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ acc [] = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ acc [] = acc
foldr' f acc (x:xs) = f x (foldr' f acc xs)

-- Usage examples
sum' :: [Int] -> Int
sum' = foldl' (+) 0

product' :: [Int] -> Int
product' = foldr' (*) 1

-- Lambda and composition
squareAll = map (\x -> x * x) [1..10]
evenNumbers = filter (\x -> x `mod` 2 == 0) [1..20]

-- Partial application
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
addFive = addThree 5  -- partially applied

main :: IO ()
main = do
  putStrLn "=== HIGHER-ORDER FUNCTIONS ==="
  
  putStrLn "\n1. Manual Implementations:"
  print $ map' (*2) [1..5]
  print $ filter' (>3) [1..10]
  print $ foldl' (+) 0 [1..5]
  print $ foldr' (:) [] [1..5]
  
  putStrLn "\n2. Using Folds:"
  print $ sum' [1..10]
  print $ product' [1..5]
  
  putStrLn "\n3. Lambda Expressions:"
  print squareAll
  print evenNumbers
  
  putStrLn "\n4. Partial Application:"
  print $ addFive 3 2  -- 5 + 3 + 2 = 10
  
  putStrLn "\n5. Built-in Functions:"
  print $ takeWhile (<10) [1..20]
  print $ dropWhile (<5) [1..10]
  print $ zipWith (+) [1,2,3] [4,5,6]
  
  putStrLn "\n=== END ==="