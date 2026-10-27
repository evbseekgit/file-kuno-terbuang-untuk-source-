wujudzat :: Double -> String
wujudzat x 
  | x <= 0     = "padat"
  | x >= 100   = "gas"
  | otherwise  = "cair"

main :: IO ()
main = do
  putStrLn "masukkan suhu dalam clcius"
  x <- readLn :: IO Double
  putStrLn ("wujud zat air dari suhu tersebut adalah " ++ show (wujudzat x))
