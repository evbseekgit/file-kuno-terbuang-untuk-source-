sigma :: Int -> Int -> (Int -> Int) -> Int
sigma a b f
    | isEmptyRange a b = 0
    | otherwise        = f a + sigma (next a) b f

next :: Int -> Int
next x = x + 1

isEmptyRange :: Int -> Int -> Bool
isEmptyRange a b = a > b

main = do
  print (sigma 1 10 (\x -> x))