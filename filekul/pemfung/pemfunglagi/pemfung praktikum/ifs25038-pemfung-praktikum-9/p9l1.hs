nElement :: [a] -> Int 
nElement [] = 0 -- Basis, saat list kosong hentikan proses 
nElement (_:listSisa) = 1 + nElement listSisa -- Rekursi dengan memotong elemen pertama list 

sumElement :: Num a => [a] -> a 
sumElement [] = 0  -- Basis, saat list kosong hentikan proses 
sumElement (element:listSisa) = element + sumElement listSisa  -- Rekursi untuk menjumlahkan elemen 

main = do 
  let lst = [1, 2, 3, 4, 5] 
      totalElement = nElement lst 
      jumlahElement = sumElement lst 
  putStrLn ("Total Element: " ++ show totalElement) 
  putStrLn ("Jumlah Element: " ++ show jumlahElement)