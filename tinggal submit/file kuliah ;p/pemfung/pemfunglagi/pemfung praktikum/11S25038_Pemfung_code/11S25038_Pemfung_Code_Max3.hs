kategoriUmur :: Int -> String
kategoriUmur umur
  | umur < 0 = "Umur tidak valid"
  | umur < 13 = if umur < 7 then "Balita" else "Anak-anak"
  | umur < 20 = "Remaja"
  | umur < 60 = "Dewasa"
  | otherwise = "Lansia"

max3 :: (Ord a) => a -> a -> a -> a
max3 x y z
  | x >= y = if x >= z then x else z
  | y >= z = y
  | otherwise = z
