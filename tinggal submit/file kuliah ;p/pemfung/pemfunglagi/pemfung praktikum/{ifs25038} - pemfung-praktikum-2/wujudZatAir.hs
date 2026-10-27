wujudZatAir :: Double -> String
wujudZatAir x
    | x < 0     = "padat"
    | x >= 100  = "gas"
    | otherwise = "cair"

main :: IO ()
main = do
    putStrLn "Masukkan suhu dalam derajat Celcius:"
    x <- readLn :: IO Double
    putStrLn ("Wujud zat air: " ++ wujudZatAir x)
