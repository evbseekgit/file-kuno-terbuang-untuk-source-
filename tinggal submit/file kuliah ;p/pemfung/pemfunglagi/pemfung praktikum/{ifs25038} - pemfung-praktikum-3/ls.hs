c :: Integer -> Integer
c x = x * x

cd :: Integer -> Integer -> Integer
cd x y = c (x - y)

ls :: Integer -> Integer -> Integer -> Integer -> Double
ls x1 y1 x2 y2 =
    let cd1 = cd y2 y1
        cd2 = cd x2 x1
        z = cd1 + cd2
    in sqrt (fromIntegral z)

main :: IO ()
main = do
    putStrLn "Masukkan x1:"
    inputX1 <- getLine
    putStrLn "Masukkan y1:"
    inputY1 <- getLine
    putStrLn "Masukkan x2:"
    inputX2 <- getLine
    putStrLn "Masukkan y2:"
    inputY2 <- getLine

    let parsedX1 = reads inputX1 :: [(Integer, String)]
        parsedY1 = reads inputY1 :: [(Integer, String)]
        parsedX2 = reads inputX2 :: [(Integer, String)]
        parsedY2 = reads inputY2 :: [(Integer, String)]

    if null parsedX1 || null parsedY1 || null parsedX2 || null parsedY2
        then putStrLn "Input tidak valid! Masukkan bilangan bulat."
        else do
            let (x1, _) = head parsedX1
                (y1, _) = head parsedY1
                (x2, _) = head parsedX2
                (y2, _) = head parsedY2
                hasil = ls x1 y1 x2 y2
            putStrLn ("Hasil Least Square: " ++ show hasil)
