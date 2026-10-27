pangkat :: Int -> Int -> Int 
pangkat a n 
    | n == 0    = 1 
    | otherwise = a * pangkat a (n - 1) 
faktorial :: Int -> Int 
faktorial n 
    | n == 0 = 1 
    | otherwise = n * faktorial (n - 1) 
fibbonaci :: Int -> Int -> Int -> Int 
fibbonaci a b n 
    | n == 1    = a 
    | n == 2    = b 
    | otherwise = fibbonaci a b (n - 1) + fibbonaci a b (n - 2) 
main :: IO () 
main = do 
    let a1 = 2
        b1 = 4
        n1 = 3
        a2 = 3 
        b2 = 6 
        n2 = 3 
    putStrLn $ "a1 = " ++ show a1 
    putStrLn $ "b1 = " ++ show b1 
    putStrLn $ "n1 = " ++ show n1 
    putStrLn $ "a2 = " ++ show a2 
    putStrLn $ "b2 = " ++ show b2 
    putStrLn $ "n2 = " ++ show n2 
    -- memanggil fungsi pangkat(a, n) 
    putStrLn $ "pangkat(a1, n1) = " ++ show (pangkat a1 n1) 
    putStrLn $ "pangkat(a2, n2) = " ++ show (pangkat a2 n2) -- memanggil fungsi faktorial(n) 
    putStrLn $ "faktorial(n1) = " ++ show (faktorial n1) 
    putStrLn $ "faktorial(n2) = " ++ show (faktorial n2) -- memanggil fungsi fibbonaci(a, b, n) 
    putStrLn $ "fibbonaci(a1, b1, n1) = " ++ show (fibbonaci a1 b1 n1) 
    putStrLn $ "fibbonaci(a2, b2, n2) = " ++ show (fibbonaci a2 b2 n2) 