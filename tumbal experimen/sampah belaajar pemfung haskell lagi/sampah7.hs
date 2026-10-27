--Grade nilai
gradeNilai :: Float -> String
gradeNilai x
  | x >= 80.00 && x <= 100 = "A"
  | x >= 75 && x < 79.9    = "AB"
  | x >= 60 && x < 74.9    = "B"
  | x >= 50 && x < 59.9    = "c"
  | x >= 0 && x < 50.99    = "udah pasti remed soalnya rendah kali nilai mu"
  | otherwise = "enggak tau aku"

main :: IO ()
main = do
  putStrLn "masukan grade nilai"
  x <- readLn :: IO Float
  putStrLn ("grade dari nilai tersebut adalah " ++ show (gradeNilai x))