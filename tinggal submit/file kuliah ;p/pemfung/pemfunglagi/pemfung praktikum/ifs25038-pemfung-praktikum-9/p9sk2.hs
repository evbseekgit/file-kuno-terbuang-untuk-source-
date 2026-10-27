-- p9sk2.hs
fibbonaci :: Integer -> Integer -> Integer -> Integer
fibbonaci a b n
    | n == 1    = a
    | n == 2    = b
    | otherwise = fibbonaci a b (n - 1) + fibbonaci a b (n - 2)

main :: IO ()
main = do
    putStr "Masukkan nilai n: "
    input <- getLine
    let n = read input :: Integer
    let result = fibbonaci 0 1 n
    putStrLn $ "fibbonaci(0, 1, n=" ++ show n ++ ") = " ++ show result