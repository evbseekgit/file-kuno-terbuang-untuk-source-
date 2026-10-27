fac :: Int -> Int
fac x 
  | x == 0 = 1
  | otherwise = x * fac (x - 1)

main :: IO ()
main = do
  putStrLn "masukkan angka fac"
  x <- readLn :: IO Int
  print (fac x)