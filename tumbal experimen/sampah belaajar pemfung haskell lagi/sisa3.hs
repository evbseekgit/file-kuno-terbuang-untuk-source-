--penggunaan guard
max2 :: Int -> Int -> String
max2 a b 
  | a > b = show b
  | b < a = show a
  |otherwise = "bego lu"

main :: IO ()
main = do
  putStrLn "masukkan angka pertama"
  a <- readLn :: IO Int
  putStrLn "masukkan angka kedua"
  b <- readLn :: IO Int
  print (max2 a b)
