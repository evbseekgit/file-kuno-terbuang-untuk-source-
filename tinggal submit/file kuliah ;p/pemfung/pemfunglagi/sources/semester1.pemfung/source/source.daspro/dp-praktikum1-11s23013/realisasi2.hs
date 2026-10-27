-- isValid(x) memeriksa apakah sebuah bilangan integer (x) valid atau tidak. 
-- valid jika bilangan x berada pada rentang nilai 0 sampai 100, bilangan lainnya dianggap tidak valid.
isValid :: Int -> Bool
isValid x = x >= 0 && x <= 100

main :: IO()
main = do
    -- memanggil fungsi isValid
    putStrLn $ "Apakah -1 bilangan valid? " ++ show (isValid (-1))
    putStrLn $ "Apakah 0 bilangan valid? " ++ show (isValid 0)
    putStrLn $ "Apakah 1 bilangan valid? " ++ show (isValid 1)
    putStrLn $ "Apakah 99 bilangan valid? " ++ show (isValid 99)
    putStrLn $ "Apakah 100 bilangan valid? " ++ show (isValid 100)
    putStrLn $ "Apakah 101 bilangan valid? " ++ show (isValid 101)
