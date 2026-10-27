max2 :: Int -> Int -> Int
max2 a b = max a b

max3 :: Int -> Int -> Int -> Int
max3 a b c = max a(max2 b c)

main :: IO ()
main = do
  print (max3 10 11 12)