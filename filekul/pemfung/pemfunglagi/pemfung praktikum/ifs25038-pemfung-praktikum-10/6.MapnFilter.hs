doubleAll = map (*2) [1,2,3,4]
onlyOdd = filter odd [1..10]

main = do
  putStrLn "Menerapkan fungsi ke semua elemen"
  print doubleAll
  putStrLn ""
  putStrLn "Menyaring elemen berdasarkan kondisi"
  print onlyOdd