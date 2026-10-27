-- c(x) menghasilkan pangkat dua dari x 
c :: Int -> Int
c x = x * x

-- cd(x,y) menghasilkan pangkat dua dari hasil pengurangan x dengan y 
cd :: Int -> Int -> Int
cd x y = c (x - y)

-- ls(x1, y1, x2, y2) menghasilkan akar dari penjumlahan pangkat dua 
--- dari hasil pengurangan y2 dengan y1 dan pangkat dua dari hasil 
pengurangan x2 dengan x1.
ls :: Int -> Int -> Int -> Int -> Double
ls x1 y1 x2 y2 =
    let cd1 = cd y2 y1
        cd2 = cd x2 x1
        z = cd1 + cd2 
    in sqrt (fromIntegral z)

    
main :: IO()
main = do
    -- memanggil fungsi isValid
    putStrLn $ "ls(1, 1, 1, 1) = " ++ show (ls 1 1 1 1)
    putStrLn $ "ls(2, 20, 3, 40) = " ++ show (ls 2 20 3 40)
    putStrLn $ "ls(70, 5, 30, 4) = " ++ show (ls 70 5 30 4)
    putStrLn $ "ls(60, 7, 7, 60) = " ++ show (ls 60 7 7 60)
    putStrLn $ "ls(9, 80, 80, 9) = " ++ show (ls 9 80 80 9)