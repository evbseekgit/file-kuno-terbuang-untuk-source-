

module Main where

main :: IO ()
main = do
    let a = 10       -- nilai a bertipe Int
    let b = 5        -- nilai b bertipe Int

    let hasilMod = a `mod` b     -- sisa bagi a dengan b
    let hasilDiv = a `div` b     -- hasil bagi a dengan b

    let gabungan = ((a * b + 15) `mod` a) `div` b

    putStrLn ("Hasil mod: " ++ show hasilMod)
    putStrLn ("Hasil div: " ++ show hasilDiv)
    putStrLn ("Gabungan operasi: " ++ show gabungan) 