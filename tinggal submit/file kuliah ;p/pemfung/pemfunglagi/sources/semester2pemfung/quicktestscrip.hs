-- Save as: QuickTest.hs untuk tes cepat
module Main where

main :: IO ()
main = do
  -- Tes semua konsep sekaligus
  putStrLn "=== QUICK TEST ALL CONCEPTS ==="
  
  -- 1. Pattern Matching
  let fact n = if n == 0 then 1 else n * fact (n-1)
  putStrLn $ "Factorial 5: " ++ show (fact 5)
  
  -- 2. List comprehension
  let squares = [x*x | x <- [1..5]]
  putStrLn $ "Squares: " ++ show squares
  
  -- 3. Higher-order functions
  let doubled = map (*2) [1..5]
  putStrLn $ "Doubled: " ++ show doubled
  
  -- 4. Recursion
  let sumList [] = 0
      sumList (x:xs) = x + sumList xs
  putStrLn $ "Sum [1..5]: " ++ show (sumList [1..5])
  
  -- 5. Error handling
  let safeDiv x y = if y == 0 then Nothing else Just (x `div` y)
  putStrLn $ "10/2: " ++ show (safeDiv 10 2)
  putStrLn $ "10/0: " ++ show (safeDiv 10 0)
  
  putStrLn "\n=== TEST COMPLETE ==="