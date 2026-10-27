gradeNilai :: Int -> String
gradeNilai x 
  | x >= 90 && x < 100 = "good"
  | otherwise = "ahh"

main :: IO  ()
main = do
  putStrLn "masukan angka malas nulis aku"
  x <- readLn :: IO Int
  print (gradeNilai x)            