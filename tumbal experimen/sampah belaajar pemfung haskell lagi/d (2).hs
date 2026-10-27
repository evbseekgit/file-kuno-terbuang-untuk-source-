--Konversi suhu c ke f
convert :: Float -> Float
convert f = (f * 9 / 5) + 32

main :: IO ()
main = do
  putStrLn "konversi suhu C ke F"
  f <- readLn :: IO Float
  print (convert f)