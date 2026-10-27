--isPositif
isPositif :: Int -> Bool
isPositif n = n >= 0

main :: IO ()
main = do
  putStrLn $ "apakah 8 adalah bilangan positif : " ++ show (isPositif 8)
