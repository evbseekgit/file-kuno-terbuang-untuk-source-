--menentukan grade dan skala nilai
nilai :: Double -> String
nilai x
  | x >= 79.5 && x <= 100 = "Grade A dan Skala 4"
  | x >= 72 && x < 79.5  = "Grade AB dan Skala 3.5"
  | x >= 64.5 && x < 72  = "Grade B dan Skala 3"
  | x >= 57 && x < 64.5  = "Grade BC dan Skala 2.5"
  | x >= 49.5 && x < 57  = "Grade C dan Skala 2"
  | x >= 34 && x < 49.5  = "Grade D dan Skala 1"
  | x >= 0 && x < 34     = "Grade E dan Skala 0"
  | otherwise          = "Nilai tidak terdefinisi"

main :: IO ()
main = do
  x <- readLn :: IO Double
  print (nilai x)