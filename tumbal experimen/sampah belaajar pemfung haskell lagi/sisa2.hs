kuadrat :: Int -> Int
kuadrat x = x * x 

maksimum :: Int -> Int -> Int
maksimum a b = if a > b then a else b

main :: IO ()
main = do
  putStrLn $ "kuadrat 3 adalah " ++ show (kuadrat 3)
  putStrLn $ "mAksimum antara 12 dan 43 adalah " ++ show (maksimum 12 43)


