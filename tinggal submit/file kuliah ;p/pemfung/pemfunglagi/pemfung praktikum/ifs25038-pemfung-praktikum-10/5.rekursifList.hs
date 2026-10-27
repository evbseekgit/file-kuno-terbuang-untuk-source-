myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

main = do
  putStrLn "Menghitung panjang list (tanpa length) [1,1,2,5,0,3,8]"
  print (myLength [1,1,2,5,0,3,8])
  putStrLn ""
  putStrLn "Menghitung jumlah elemen [1,5,34,2,4,5,5]"
  print (mySum [1,5,34,2,4,5,5])
