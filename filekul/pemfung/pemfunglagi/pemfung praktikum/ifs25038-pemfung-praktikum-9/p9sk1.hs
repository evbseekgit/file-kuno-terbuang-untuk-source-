fac :: Int -> Int
fac n = if n == 0 then 1 else n * fac (n - 1)

main :: IO ()
main = do
  putStrLn "masukkan Nilai N"
  n <- readLn :: IO Int
  putStrLn $ "facktorial(" ++ show n ++ ") = " ++ show (fac n)