--NAMA  : WESLY AMBARITA
--NIM   : 11S23013
--PRODI : INFORMATIKA

data Point = Point { x :: Int , y :: Int } deriving Show 
 -- Realisasi Selektor merupakan absis(p) memberikan nilai absis dari Point p  
absis :: Point -> Int 
absis point = x point -- > ordinat(p) merupakan fungsi memberikan nilai ordinat dari Point p 
ordinat :: Point -> Int 
ordinat point = y point 
 -- Realisasi Konstruktor -- > makePoint(x,y) fungsi untuk membuat sebuah Point p dari x dan y dengan x sebagai absis dan y sebagai ordinat  
makePoint :: Int -> Int -> Point 
makePoint x y = Point { x = x , y = y } 
 -- Realisasi Predikat -- > isOrigin(p) fungsi yang bergunsa untuk mengembalikan nilai benar jika titik p adalah titik pusat (0,0)  
isOrigin :: Point -> Bool
isOrigin p = absis p == 0 && ordinat p == 0 -- > kuadran (p) mengembalikan ouput berupa lokasi kuadran dari titik p  
kuadran :: Point -> String 
kuadran p 
    | absis p > 0 && ordinat p > 0 = "1" 
    | absis p < 0 && ordinat p > 0 = "2" 
    | absis p < 0 && ordinat p < 0 = "3" 
    | absis p > 0 && ordinat p < 0 = "4" 
    | otherwise                    = "Lainnya" 
    -- > isOnS bY(p) adalah fungsi untuk mengecek apakah titik p berada pada sumbu Y atau tidak.  
isOnSbY :: Point -> Bool 
isOnSbY p = absis p == 0 

 -- >isEqual(p1, p2) adalah fungsi untuk mengecek apakah titik p1 sama dengan titik p2.  
isEqual :: Point -> Point -> Bool 
isEqual p1 p2 = absis p1 == absis p2 && ordinat p1 == ordinat p2

 -- Realisasi Operator -- > translasiSbY(p, n) adalah fungsi untuk mengembalikan sebuah titik hasil translasi titik p, searah sumbu Y, sejauh n. 
translasiSbY :: Point -> Int -> Point 
-- TODO: realisasi Haskell disini 
translasiSbY p n = Point { x = absis p , y = ordinat p + n}

 -- >jarak(p1, p2) adalah fungsi untuk mengembalikan sebuah nilai real, merupakan jarak antara titik p1 dan p2 
jarak :: Point -> Point -> Double -- TODO: realisasi Haskell disini 
jarak p1 p2= sqrt (fromIntegral ((absis p1 - absis p2)^2 + (ordinat p1 - ordinat p2)^2))

main :: IO () 
main = do 
    x1 <- readLn :: IO Int 
    y1 <- readLn :: IO Int 
    x2 <- readLn :: IO Int 
    y2 <- readLn :: IO Int 
    n <- readLn :: IO Int 
 
  -- membuat point 
    let p1 = makePoint x1 y1 
        p2 = makePoint x2 y2 
   
    putStrLn $ "p1 = " ++ show p1 
    putStrLn $ "p2 = " ++ show p2 
    putStrLn $ "n = " ++ show n 

    putStrLn $ "isOnSbY(p1) = " ++ show (isOnSbY p1) 
    putStrLn $ "isOnSbY(p2) = " ++ show (isOnSbY p2) 
  
    putStrLn $ "isEqual(p1, p2) = " ++ show (isEqual p1 p2) 
 
    putStrLn $ "tr  anslasiSbY(p1, n) = " ++ show (translasiSbY p1 n) 
    putStrLn $ "translasiSbY(p2, n) = " ++ show (translasiSbY p2 n) 
 
    putStrLn $ "jarak(p1, p2) = " ++ show (jarak p1 p2)
















































    --WESLY
    --WESLY
    --WESLY
    --WESLY

    --WESLY
    --WESLY
    --WESLY
    
    --WESLY
    
    --WESLY
    
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
 --WESLY
    --WESLY
    --WESLY
    --WESLY

    --WESLY
    --WESLY
    --WESLY
    
    --WESLY
    
    --WESLY
    
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
 --WESLY
    --WESLY
    --WESLY
    --WESLY

    --WESLY
    --WESLY
    --WESLY
    
    --WESLY
    
    --WESLY
    
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
 --WESLY
    --WESLY
    --WESLY
    --WESLY

    --WESLY
    --WESLY
    --WESLY
    
    --WESLY
    
    --WESLY
    
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
 --WESLY
    --WESLY
    --WESLY
    --WESLY

    --WESLY
    --WESLY
    --WESLY
    
    --WESLY
    
    --WESLY
    
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
 --WESLY
    --WESLY
    --WESLY
    --WESLY

    --WESLY
    --WESLY
    --WESLY
    
    --WESLY
    
    --WESLY
    
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
 --WESLY
    --WESLY
    --WESLY
    --WESLY

    --WESLY
    --WESLY
    --WESLY
    
    --WESLY
    
    --WESLY
    
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
    --WESLY
