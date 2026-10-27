kalkulator :: Int -> Int -> Int
kalkulator x y = x + y

main :: IO ()
main = do
  putStrLn "tambah"
  x <- readLn :: IO Int
  y <- readLn :: IO Int
  print (kalkulator x y)
