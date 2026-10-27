data Point = Point { x :: Int , y :: Int} deriving Show

absis :: Point -> Int
absis point = x point

ordinat :: Point -> Int
ordinat point = y point

makePoint :: Int -> Int -> Point
makePoint x y = Point {x = x , y = y}

isOrigin :: Point -> Bool
isOrigin p = absis p == 0 && ordinat p == 0

kuadran :: Point -> String 
kuadran p
    | absis p > 0 && ordinat p > 0 = "1"
    | absis p < 0 && ordinat p > 0 = "2"
    | absis p < 0 && ordinat p < 0 = "3"
    | absis p > 0 && ordinat p < 0 = "4"
    | otherwise                      = "Lainnya"

isOnSbY :: Point -> Bool
isOnSbY p = absis p == 0

isEqual :: Point -> Point -> Bool
isEqual p1 p2 = absis p1 == absis p2 && ordinat p1 == ordinat p2

translasiSbY :: Point -> Int -> Point
translasiSbY p n = Point {x = absis p , y = ordinat p + n}

jarak :: Point -> Point -> Double
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
 
    putStrLn $ "translasiSbY(p1, n) = " ++ show (translasiSbY p1 n) 
    putStrLn $ "translasiSbY(p2, n) = " ++ show (translasiSbY p2 n) 
 
    putStrLn $ "jarak(p1, p2) = " ++ show (jarak p1 p2)





