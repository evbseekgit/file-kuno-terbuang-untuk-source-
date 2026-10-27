max3 :: Int -> Int -> Int -> Int
max3 a b c  
  | a > b = a
  | b > c = b
  | otherwise = c

main :: IO ()
main = do 
  print (max3 3 2 1)
  