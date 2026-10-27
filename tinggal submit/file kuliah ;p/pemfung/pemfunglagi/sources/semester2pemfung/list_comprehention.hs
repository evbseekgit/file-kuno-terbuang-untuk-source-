-- Save as: ListComprehension.hs
module ListComprehension where

-- Basic comprehensions
squares = [x^2 | x <- [1..10]]
evens = [x | x <- [1..20], even x]

-- Multiple generators
pairs = [(x, y) | x <- [1..3], y <- ['a','b','c']]

-- Pythagorean triples
pythagoreanTriples = 
  [(a, b, c) | 
    a <- [1..10], 
    b <- [a..10], 
    c <- [b..10], 
    a^2 + b^2 == c^2]

-- String manipulation
vowels = [c | c <- "Hello World", c `elem` "aeiouAEIOU"]

-- Quicksort using comprehension
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (pivot:xs) =
  let smaller = quicksort [x | x <- xs, x < pivot]
      bigger = quicksort [x | x <- xs, x >= pivot]
  in smaller ++ [pivot] ++ bigger

-- Matrix operations
matrix = [[(i, j) | j <- [1..3]] | i <- [1..3]]
transpose m = [[row !! i | row <- m] | i <- [0..length (head m) - 1]]

main :: IO ()
main = do
  putStrLn "=== LIST COMPREHENSIONS ==="
  
  putStrLn "\n1. Basic Comprehensions:"
  print $ take 5 squares
  print $ take 10 evens
  
  putStrLn "\n2. Multiple Generators:"
  print pairs
  
  putStrLn "\n3. Pythagorean Triples:"
  print pythagoreanTriples
  
  putStrLn "\n4. String Operations:"
  print vowels
  
  putStrLn "\n5. Quicksort:"
  print $ quicksort [3,1,4,1,5,9,2,6,5,3,5]
  
  putStrLn "\n6. Matrix Operations:"
  print matrix
  print $ transpose matrix
  
  putStrLn "\n=== END ==="