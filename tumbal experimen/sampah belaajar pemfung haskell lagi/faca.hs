fac :: Int -> Int
fac x 
  | (x - 1) == 0 = 1
  | otherwise = x * fac (x - 1)

main :: IO ()
main = do
  putStrLn "masukkan nilai faktorial"
  x <- readLn :: IO Int
  print (fac x)