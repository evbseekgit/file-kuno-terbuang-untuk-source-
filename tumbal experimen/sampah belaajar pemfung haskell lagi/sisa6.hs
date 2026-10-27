wujudzat :: Float -> String          
wujudzat a 
  | a <= 0               = "membeku atau es(padat)"
  | a > 0.0 && a < 100.0 = "air,cair (liquid)"
  | otherwise            = "mendidih,uap (gas)"

main :: IO ()
main = do
  putStrLn "masukkan suhu zat"
  a <- readLn :: IO Float
  print " wujudzat adalah (" ++ wujudzat a ++ ") "