-- Save as: ListManipulation.hs
module ListManipulation where

-- Ranges
basicRange = [1..10]
stepRange = [1,3..20]
charRange = ['a'..'z']
descRange = [10,9..1]

-- Infinite lists
nats = [0..]  -- natural numbers
cycleExample = take 10 (cycle [1,2,3])
repeatExample = take 5 (repeat 7)

-- List functions
take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (_:xs) = drop' (n-1) xs

-- Working with infinite lists
firstTenEvens = take 10 [x | x <- [0..], even x]
fibonacci = 0 : 1 : zipWith (+) fibonacci (tail fibonacci)

-- List processing pipeline
processList = 
  let nums = [1..100]
  in sum . map (*3) . filter even . take 20 $ nums

main :: IO ()
main = do
  putStrLn "=== LIST MANIPULATION ==="
  
  putStrLn "\n1. Ranges:"
  print basicRange
  print stepRange
  putStrLn $ take 5 charRange
  print descRange
  
  putStrLn "\n2. Infinite Lists:"
  print $ take 15 nats
  print cycleExample
  print repeatExample
  
  putStrLn "\n3. Custom List Functions:"
  print $ take' 5 [1..10]
  print $ drop' 3 [1..10]
  
  putStrLn "\n4. Infinite List Operations:"
  print firstTenEvens
  print $ take 15 fibonacci
  
  putStrLn "\n5. Processing Pipeline:"
  print processList
  
  putStrLn "\n6. Useful List Functions:"
  print $ zip [1..5] ['a'..'e']
  print $ unzip [(1,'a'),(2,'b'),(3,'c')]
  print $ intercalate ", " ["apple", "banana", "cherry"]
  
  putStrLn "\n=== END ==="