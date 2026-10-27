
isPositif :: Integer -> Bool
isPositif x = x >= 0

main :: IO ()
main = do
    putStrLn "Masukkan sebuah bilangan bulat:"
    input <- getLine
    let number = read input :: Integer
    if isPositif number
        then putStrLn "Bilangan tersebut adalah POSITIF."
        else putStrLn "Bilangan tersebut adalah NEGATIF."
