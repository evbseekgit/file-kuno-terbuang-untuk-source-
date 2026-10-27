--isValid = fungsi yang memeriksa apakah nilai input lebih besar sama dengan 0 atau lebih kecil dari pada 100 alias integer antara 0 dan 100

bilAntara :: Int -> String
bilAntara n = if n >= 0 && n <= 100 
  then "bilangan tersebugt ada di antara 0 dan 100" 
  else "ngotaklah kocak"

main :: IO ()
main = do
  putStrLn "ketikkanlah angka antara 0 dan 100"
  n <- readLn :: IO Int
  print (bilAntara n)