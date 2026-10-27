--menentukan wujud zat cair berdasarkan suhu
suhu :: Double -> String
suhu x
  | x <= 0    = "Padat"
  | x >= 100  = "Gas"
  | otherwise = "Cair"

main :: IO ()
main = do
    x <- readLn :: IO Double
    print (suhu x)