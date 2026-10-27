--Nama = Wesly Ambarita
--NIM  = 11S23013
--Kelas= 11IF1
--Prodi= Informatika

min2 :: Int -> Int -> Int 
--min2(y, z) adalah fungsi yang berfungsi untuk menentukan bilangan bulat yang terkecil dari y dan z yang mana y dan z merupakan bilangan bulat sebagai inputan pada fungsi
min2 y z = 
    if z > y
        then y else z

min3 :: Int -> Int -> Int -> Int
--min3(x, y, z) adalah fungsi yang berfungsi untuk menentukan bilangan bulat yang terkecil dari x, y dan z yang mana x, y, dan z merupakan bilangan bulat sebagai inputan pada fungsi
min3 x y z = 
    min2 x (min2 y z)

min4 :: Int -> Int -> Int -> Int -> Int
--min4(v, x, y, z) adalah fungsi yang berfungsi untuk menentukan bilangan bulat yang terkecil dari v, x, y dan z yang mana v, x, y, dan z merupakan bilangan bulat sebagai inputan pada fungsi
min4 v x y z = 
    min2 v (min3 x y z)

main :: IO ()
main = do
    v <- readLn :: IO Int
    x <- readLn :: IO Int
    y <- readLn :: IO Int
    z <- readLn :: IO Int

-- memanggil fungsi min4
    print (min4 v x y z)