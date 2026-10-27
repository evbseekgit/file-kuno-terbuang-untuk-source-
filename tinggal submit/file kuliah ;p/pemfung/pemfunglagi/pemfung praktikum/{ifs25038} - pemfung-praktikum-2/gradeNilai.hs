grade :: Double -> String
grade x
    | x >= 80     = "A"
    | x >= 72     = "AB"
    | x >= 65     = "B"
    | x >= 57     = "BC"
    | x >= 50     = "C"
    | x >= 35     = "D"
    | otherwise   = "E"

main :: IO ()
main = do
    putStrLn "Masukkan nilai ujian (0 - 100):"
    x <- readLn :: IO Double
    putStrLn ("Grade: " ++ grade x)
