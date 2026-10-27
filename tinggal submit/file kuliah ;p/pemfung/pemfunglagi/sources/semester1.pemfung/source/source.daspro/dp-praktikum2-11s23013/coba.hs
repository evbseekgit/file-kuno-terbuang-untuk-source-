min4 :: Int -> Int -> Int -> Int -> Int
--min4(v, x, y, z) adalah fungsi yang berfungsi untuk menentukan bilangan bulat yang terkecil dari v, x, y dan z yang mana v, x, y, dan z merupakan bilangan bulat sebagai inputan pada fungsi
min4 v x y z = if x < y && x < z && x < v
                    then x
                else if y < x && y < z && y < v
                    then y
                else if z < v && z < x && z < y
                    then z
                    else v

main :: IO ()
main = do
    v <- readLn :: IO Int
    x <- readLn :: IO Int
    y <- readLn :: IO Int
    z <- readLn :: IO Int

-- memanggil fungsi min4
    print (min4 v x y z)
