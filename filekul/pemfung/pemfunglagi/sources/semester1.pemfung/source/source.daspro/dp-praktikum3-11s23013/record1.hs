data Point = Point { x :: Int , y :: Int} deriving Show

--absis  memberikan absis dari Point p 
absis :: Point -> Int
absis point = x point

--ordinat  memberikan ordinat dari Point p
ordinat :: Point -> Int
ordinat point = y point

--makePoint  membentuk sebuah Point p dari x dan y dengan x sebagai absis dan y sebagai ordinat
makePoint :: Int -> Int -> Point
makePoint x y = Point {x = x , y = y}

--isOrigin  mengembalikan nilai benar jika titik p adalah titik pusat(0,0)
isOrigin :: Point -> Bool
isOrigin p = absis p == 0 && ordinat p == 0

--kuadran  mengembalikan lokasi kuadran dari titik p  
kuadran :: Point -> String
kuadran p
    | absis p > 0 && ordinat p > 0 = "1"
    | absis p < 0 && ordinat p > 0 = "2"
    | absis p < 0 && ordinat p < 0 = "3"
    | absis p < 0 && ordinat p > 0 = "4"
    | otherwise                    = "Lainnya"

--isOnSbY  melakukan pengecekan apakah titik p berada pada sumbu Y
isOnSbY :: Point -> Bool
isOnSbY p = absis p == 0

--isEqual  melakukan pengecekan apakah titik p1 sama dengan titik p2.
isEqual :: Point -> Point -> Bool
isEqual p1 p2 = absis p1 == absis p2 && ordinat p1 == ordinat p2

--translasiSbY   mengembalikan sebuah titik hasil translasi titik p, searah sumbu Y, sejauh n
translasiSbY :: Point -> Int -> Point
translasiSbY p n = Point {x = absis p , y = ordinat p + n}

--jarak  mengembalikan sebuah nilai real, merupakan jarak antara titik p1 dan p2
jarak :: Point -> Point -> Double 
jarak p1 p2 = sqrt(fromIntegral((absis p1 - absis p2)^2 + (ordinat p1 - ordinat p2)^2))

main :: IO ()
main = do
    x1 <- readLn :: IO Int
    y1 <- readLn :: IO Int
    x2 <- readLn :: IO Int
    y2 <- readLn :: IO Int
    n <- readLn :: IO Int

    let p1 = makePoint x1 y1
        p2 = makePoint x2 y2

    putStrLn $ "p1 = " ++ show p1 
    putStrLn $ "p2 = " ++ show p2 
    putStrLn $ "n = " ++ show n

        -- memanggil fungsi isOnSbY(p) 
    putStrLn $ "isOnSbY(p1) = " ++ show (isOnSbY p1) 
    putStrLn $ "isOnSbY(p2) = " ++ show (isOnSbY p2) 
    
    -- memanggil fungsi isEqual(p1, p2) 
    putStrLn $ "isEqual(p1, p2) = " ++ show (isEqual p1 p2) 
    
    -- memanggil fungsi translasiSbY(p, n) 
    putStrLn $ "translasiSbY(p1, n) = " ++ show (translasiSbY p1 n) 
    putStrLn $ "translasiSbY(p2, n) = " ++ show (translasiSbY p2 n) 
    
    -- memanggil fungsi jarak(p1, p2) 
    putStrLn $ "jarak(p1, p2) = " ++ show (jarak p1 p2) 