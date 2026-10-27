list1 :: [Int]
list1 = [2,4,6,7,9,14,67,89,04,12]

main :: IO ()
main = do
  putStrLn "tambah 1 angka ke list"
  x <- readLn :: IO Int
  let tambah1 = x
  print (tambah1 : list1)
  putStrLn "sekali lagi"
  let oo = (tambah1 : list1)
  y <- readLn :: IO Int
  print (y : oo)
  print (y : list1)