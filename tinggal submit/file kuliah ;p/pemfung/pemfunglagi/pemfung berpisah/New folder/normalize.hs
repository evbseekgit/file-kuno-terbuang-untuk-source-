normalize :: [Double] -> [Double]
normalize xs = map (\x -> x - avg) xs
  where avg = sum xs / fromIntegral (length xs)

main = do
    let numbers = [1.0, 2.0, 3.0, 4.0, 5.0]
    print $ normalize numbers