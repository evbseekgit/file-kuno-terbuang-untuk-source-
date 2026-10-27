combined = [1,2,3] ++ [4,5]
take3 = take 3 [10,20,30,40,50]
drop2 = drop 2 [10,20,30,40,50]

main = do
  putStrLn "2 list digabung : [1,2,3] dengan [4,5] menghasilkan :"
  print combined
  putStrLn ""
  putStrLn "mengambil sebagian elemen dari [10,20,30,40,50] ="
  print take3
  putStrLn ""
  putStrLn "membuang 2 elemen pertama dari [10,20,30,40,50] ="
  print drop2
