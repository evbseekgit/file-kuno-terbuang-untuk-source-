waktu :: Int -> Bool
waktu a =
  a >= 0 && a <= 12

alokasi1 :: Bool -> String
alokasi1 True = print a ++ putStrLn ".am"

main :: IO ()
main = do
  putStrLn "jam berapa disebut .am"
  a <- readLn :: IO Int
  print (waktu a)  