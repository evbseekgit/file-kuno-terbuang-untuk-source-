sumOddSquares = sum [x*x | x <- [1..10], odd x]

main = do
  putStrLn "bilangan ganjil dari 1 sampai 10 dikuadratkan lalu hasilnya dijumlahkan"
  print sumOddSquares