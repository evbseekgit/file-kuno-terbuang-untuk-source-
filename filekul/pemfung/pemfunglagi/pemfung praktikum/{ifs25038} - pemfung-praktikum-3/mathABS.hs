mathABS :: Integer -> Integer
mathABS x
    | x > 0     = x
    | x == 0    = 0
    | otherwise = -x

main :: IO ()
main = do
    putStrLn "Masukkan sebuah bilangan integer:"
    input <- getLine
    let parsed = reads input :: [(Integer, String)]
    if null parsed
        then putStrLn "Input tidak valid! Harus bilangan bulat."
        else do
            let (x, _) = head parsed
            putStrLn ("Nilai absolutnya adalah: " ++ show (mathABS x))