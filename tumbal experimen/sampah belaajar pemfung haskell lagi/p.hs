isPositif :: Int -> String
isPositif x = if x >= 0 then "pinter" else "bego lu!"

main :: IO ()
main = do
  putStrLn "silahkan masukkan angka yang positif"
  x <- readLn :: IO Int
  print (isPositif x)
