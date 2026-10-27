fac :: Int -> Int                                                                               
fac n = if n == 0 then 1 else n * fac (n - 1)

main :: IO ()
main = do
  putStrLn "masukkan bilangan faktorial"
  n <- readLn :: IO Int
  putStrLn $ "hasil dari facktorial (" ++ show n ++ ") adalah : "
  print (fac n)