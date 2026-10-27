makan :: Int -> Bool
makan a = a >= 1 && a <= 3

ubahFakta :: Bool -> String
ubahFakta True = "yap sudah pasti walaupun harusnya lebih rendah dari itu"
ubahFakta False = "enggak salah cobak lihat lagi"

gabungkan :: Int -> String
gabungkan a = ubahFakta (makan a)

main :: IO ()
main = do
  putStrLn "sebera gantengkah steven manurung dari nilai 1 - 10 ?"
  a <- readLn :: IO Int
  print (gabungkan a)

  