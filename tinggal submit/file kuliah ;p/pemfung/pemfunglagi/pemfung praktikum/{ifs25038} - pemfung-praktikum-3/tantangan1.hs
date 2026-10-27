min2 :: Int -> Int -> Int
min2 w x = min w x
min3 :: Int -> Int -> Int -> Int
min3 w x y = min w (min w x)
min4 :: Int -> Int -> Int -> Int -> Int
min4 w x y z = min (min w x) (min y z)

main :: IO ()
main = do
    print (min4 4 9 8 2)