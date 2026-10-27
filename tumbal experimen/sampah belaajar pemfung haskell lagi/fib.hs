fib :: Int -> Int
fib x 
  | x == 0 = 0
  | x == 1 = 1
  | otherwise = fib (x - 1) + fib (x - 2)

main :: IO ()
main = do
  putStrLn "bilangan fibonacci"
  x <- readLn :: IO Int

  if x < 0 
    then putStrLn "massukan angka lebih besar dari nol"
    else print (fib x)