-- max2(x, y) mengambil nilai terbsesar dari 2 bilangan integer 
max2 :: Int -> Int -> Int
max2 x y = if x > y
    then x
    else y
main :: IO ()
main = do
-- memanggil fungsi max2
    putStrLn $ "Nilai max2(10, 20) " ++ show (max2 10 20)
    putStrLn $ "Nilai max2(-10, -20) = " ++ show (max2 (-10) (-20))
    putStrLn $ "Nilai max2(0, 0) = " ++ show (max2 0 0)
    putStrLn $ "Nilai max2(-20, -10) = " ++ show (max2 (-20) (-10))
    putStrLn $ "Nilai max2(20, 10) " ++ show (max2 20 10)