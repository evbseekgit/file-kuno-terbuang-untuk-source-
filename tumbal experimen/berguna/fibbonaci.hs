fib :: Int -> Int
fib x 
  | x == 0 = 0
  | x == 1 = 1
  | otherwise = fib (x - 1) + fib (x - 2)

main :: IO ()
main = do
  x <- readLn :: IO Int
  print (fib x)