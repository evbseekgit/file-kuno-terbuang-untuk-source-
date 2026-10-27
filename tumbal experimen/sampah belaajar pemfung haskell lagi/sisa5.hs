fib :: Int -> Int                                              
fib t 
  | t == 0 = 0
  | t == 1 = 1
  | otherwise = fib ( t - 1 ) + fib ( t - 2 )

main :: IO ()
main = do
  t <- readLn :: IO Int
  print (fib t)