faktorial :: Int -> Int
faktorial 0 = 1
faktorial n = n * faktorial (n - 1)

main = do
  putStrLn $ "5! = " ++ show (faktorial 5)


















--cara untuk menjalankannya di terminal normal itu dengan cara runghc sampah.hs 
--dan untuk di ghci tanpa load tinggal tulis putStrLn "konstantinople" 
--dan dengan load tulis (:main sampah.hs)