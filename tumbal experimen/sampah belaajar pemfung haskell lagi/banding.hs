max2 :: Int -> Int -> Int
max2 = max

main :: IO ()
main = do
  putStrLn "masukkan nilai pertama"
  a <- readLn :: IO Int
  putStrLn "masukkan nilai kedua"
  b <- readLn :: IO Int
  putStrLn "angka yang lebih besar adalah"
  print (max a b)

