
isValid :: Integer -> Bool
isValid x = x >= 0 && x <= 100

main :: IO ()
main = do
    putStrLn "Masukkan sebuah bilangan integer:"
    input <- getLine
    let parsed = reads input :: [(Integer, String)]
    if null parsed
        then putStrLn "Input tidak valid! Harus bilangan bulat."
        else do
            let (x, _) = head parsed
            if isValid x
                then putStrLn "Bilangan tersebut valid."
                else putStrLn "Bilangan tersebut tidak valid."
