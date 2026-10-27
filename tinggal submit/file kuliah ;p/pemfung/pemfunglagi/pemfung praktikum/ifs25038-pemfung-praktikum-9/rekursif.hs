fac :: Int -> Int
fac n = if n == 0 then 1 else n * fac (n - 1)

fibbonaci :: Integer -> Integer -> Integer -> Integer
fibbonaci a b n
    | n == 1    = a
    | n == 2    = b
    | otherwise = fibbonaci a b (n - 1) + fibbonaci a b (n - 2)

main :: IO ()
main = do
  putStr "Masukkan nilai N (indeks): "
  input <- getLine
  let n = read input :: Int
  putStrLn $ "faktorial(" ++ show n ++ ") = " ++ show (fac n)
  let n2 = read input :: Integer
  putStrLn $ "fibbonaci(0, 1, n=" ++ show n2 ++ ") = " ++ show (fibbonaci 0 1 n2)