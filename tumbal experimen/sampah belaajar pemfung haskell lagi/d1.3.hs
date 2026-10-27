--GanjilGen
oddEven :: Int -> String
oddEven x = if even x then "Genap" else "Ganjil" 

main :: IO ()
main = do
  putStrLn "MASUKKAN ANGKA"
  x <- readLn :: IO Int
  print (oddEven x)