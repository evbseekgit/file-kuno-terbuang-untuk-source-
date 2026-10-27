squares = [x * x | x <- [1..5]]
evens = [x | x <- [1..10], even x]

main = do
  putStrLn "pangkat kuadrat dari 1 sampai 5"
  print squares 
  putStrLn ""
  putStrLn "angka genap dari 1 sampai 10"
  print evens