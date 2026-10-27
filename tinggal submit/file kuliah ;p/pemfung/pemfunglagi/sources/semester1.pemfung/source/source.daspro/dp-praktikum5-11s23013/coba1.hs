data Jam = Jam {hh :: Int , mm :: Int, ss :: Int} deriving Show

makeHour :: Int -> Int -> Int -> Jam
makeHour a b c = Jam {hh = a , mm = b , ss = c }

hour :: Jam -> Int
hour j = hh j

minute :: Jam -> Int
minute j = mm j

second :: Jam -> Int
second j = ss j

hourToSecond :: Jam -> Int
hourToSecond j = (hour j * 3600) + (minute j * 60) + (second j) 

secondToHour :: Int -> Jam
secondToHour n = Jam {hh = if n >= 3600 then n `div` 3600
                           else 0 ,
                      mm = if n >= 3600 then sisaSecond `div` 60
                           else if n >= 60 then n `div` 60
                           else 0 , 
                      ss = if n >= 3600 then sisaSecond `mod` 60
                           else if n >= 60 then n `mod` 60 
                           else 0  }
                where 
                    sisaSecond = n `mod` (3600)

convert24To12 :: Jam -> String
convert24To12 j = if hour j <=12 then show (hour j) ++ ":" ++ show (minute j) ++ ":" ++ show (second j) ++ " AM"
                  else show (hour j `mod` 12) ++ ":" ++ show (minute j) ++ ":" ++ show (second j) ++ " PM"             
            
convert12To24 :: String -> String
convert12To24 time = let
    (hh, mm, ss, period) = read time :: (Int, Int, Int, String)
    hour24 = if period == "AM"
             then if hh == 12 then 0 else hh
             else if hh == 12 then 12 else hh + 12
    in format24 hour24 mm ss

format24 :: Int -> Int -> Int -> String
format24 hh mm ss = pad2 hh ++ ":" ++ pad2 mm ++ ":" ++ pad2 ss

pad2 :: Int -> String
pad2 n = if n < 10 then "0" ++ show n else show n

addHours :: Jam -> Jam -> Jam
addHours a b =  jamNormal $ Jam {hh = hour a + hour b,
                                 mm = minute a + minute b ,
                                 ss = second a + second b}

jamNormal :: Jam  -> Jam -> Jam
jamNormal a b = Jam { hh = ((hour a ((minute a + ((second a + second b) div 60)) div 60)) div 24) mod 24, 
                      mm = ((minute a + ((second a ) div 60)) div 60 + (second a) div 3600) mod 60,
                      ss = (second a + second b) mod 60}

subHours :: Jam -> Jam ->Jam
subHours a b =  jamNormal $ Jam { hh = hour a - hour b,
                                 mm = minute a - minute b,
                                 ss = second a - second b}

isEqD :: Jam -> Jam -> Bool
isEqD a b = (second a == second b) && (minute a == minute b) && (hour a == hour b)

isNotEqD :: Jam -> Jam -> Bool
isNotEqD a b = second a /= second b || minute a /= minute b || hour a /= hour b

main :: IO()
main = do 
    h1 <- readLn :: IO Int
    m1 <- readLn :: IO Int
    d1 <- readLn :: IO Int
    h2 <- readLn :: IO Int
    m2 <- readLn :: IO Int
    d2 <- readLn :: IO Int  
    n  <- readLn :: IO Int

    let j1 = makeHour h1 m1 d1
        j2 = makeHour h2 m2 d2

    putStrLn $ "h1 = " ++ show h1 
    putStrLn $ "m1 = " ++ show m1
    putStrLn $ "d1 = " ++ show d1
    putStrLn $ "h2 = " ++ show h2
    putStrLn $ "m2 = " ++ show m2
    putStrLn $ "d2 = " ++ show d2
    putStrLn $ "n = " ++ show n

    putStrLn $ "hourToSecond(j) = " ++ show  (hourToSecond j1) 
    putStrLn $ "hourToSecond(j) = " ++ show  (hourToSecond j2) 
    putStrLn $ "secondToHour(j) = " ++ show  (secondToHour n)
    putStrLn $ "convert24To12(j) = " ++ show  (convert24To12 j1)
    putStrLn $ "convert24To12(j) = " ++ show  (convert24To12 j2)
    -- putStrLn $ "convert12To24(j) = " ++ show  (convert12To24 j1)
    -- putStrLn $ "convert12To24(j) = " ++ show  (convert12To24 j2)
    putStrLn $ "addHours(j1, j2) = " ++ show  (addHours j1 j2)
    putStrLn $ "addHours(j1, j2) = " ++ show  (addHours j1 j2)
    putStrLn $ "subHours(j1, j2) = " ++ show  (subHours j1 j2)
    putStrLn $ "subHours(j1, j2) = " ++ show  (subHours j1 j2)
    putStrLn $ "isEqD(j1, j2) = " ++ show (isEqD j1 j2 )
    putStrLn $ "isNotEqD(j1, j2) = " ++ show (isNotEqD j1 j2)