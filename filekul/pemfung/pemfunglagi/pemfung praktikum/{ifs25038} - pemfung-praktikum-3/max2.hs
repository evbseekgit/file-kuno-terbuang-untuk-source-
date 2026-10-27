max2 :: Integer -> Integer -> Integer
max2 x y =
    if x > y
        then x
        else y


main :: IO ()
main = do
    putStrLn "Masukkan bilangan pertama:"
    input1 <- getLine
    putStrLn "Masukkan bilangan kedua:"
    input2 <- getLine

    let parsed1 = reads input1 :: [(Integer, String)]
        parsed2 = reads input2 :: [(Integer, String)]

    if null parsed1 || null parsed2
        then putStrLn "Input tidak valid! Harus bilangan bulat."
        else do
            let (x, _) = head parsed1
                (y, _) = head parsed2
                hasil = max2 x y
            putStrLn ("Bilangan terbesar adalah: " ++ show hasil)
