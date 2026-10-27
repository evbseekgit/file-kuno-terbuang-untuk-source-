--Grade nilai
grade :: Float -> Char
grade x 
  | x > 100 && x >= 90 = 'A'
  | x < 90 && x >= 80 = 'B'
  | x < 80 && x >= 70 = 'C'
  | otherwise = 'D'

main :: IO ()
main = do
  putStrLn "Grade Nilai"
  x <- readLn :: IO Float
  print (grade x)
