kalkulator :: Double -> Double -> Char -> Double
kalkulator a b c
    | c == '+' = a + b 
    | c == '-' = a - b
    | c == '*' = a * b 
    | c == '/' = a / b 
    | otherwise = error "Operasi tidak valid"

main :: IO ()
main = do
  putStrLn "Masukkan angka pertama:"
  satu <- readLn :: IO Double
  putStrLn "Masukkan angka kedua:"
  dua <- readLn :: IO Double
  putStrLn "Masukkan operasi (+, -, *, /):"
  tiga <- getChar
  putStrLn $ "Hasil: " ++ show (kalkulator satu dua tiga)
