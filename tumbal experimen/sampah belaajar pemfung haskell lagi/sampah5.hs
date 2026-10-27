isPositif :: Int -> Bool
isPositif x = x >= 0 
 
main :: IO ()
main = do
  putStrLn "apakah bilangan ini positif"
  x <- readLn :: IO Int
  print (isPositif x)

--print itu bergerak sendiri setidaknya untuk saat ini dan print perlu dibaca dengan readLine jika diatas ada definisi seperti ispositif :: int -> bool
--print 

-- referensi isPositif.hs