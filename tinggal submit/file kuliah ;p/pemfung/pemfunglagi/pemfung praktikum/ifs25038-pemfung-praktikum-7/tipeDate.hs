-- Tipe bentukan Date
data Date = Date { dd :: Int, mm :: Int, yy :: Int } deriving (Show)

-- 1. KONSTRUKTOR
makeDate :: Int -> Int -> Int -> Date
makeDate dd mm yy = Date { dd = dd, mm = mm, yy = yy }

-- 2. SELEKTOR
day :: Date -> Int
day (Date dd _ _) = dd

month :: Date -> Int
month (Date _ mm _) = mm

year :: Date -> Int
year (Date _ _ yy) = yy

isLeapYear :: Int -> Bool
isLeapYear year
    | year `mod` 400 == 0 = True
    | year `mod` 100 == 0 = False
    | year `mod` 4 == 0   = True
    | otherwise          = False

daysInMonth :: Int -> Int -> Int
daysInMonth month year
    | month == 2 && isLeapYear year = 29
    | month == 2 = 28
    | month `elem` [4,6,9,11] = 30
    | otherwise = 31

-- 3. OPERATOR
nextDay :: Date -> Date
nextDay (Date dd mm yy)
    | dd < daysInMonth mm yy = Date (dd + 1) mm yy
    | mm < 12 = Date 1 (mm + 1) yy
    | otherwise = Date 1 1 (yy + 1)

yesterday :: Date -> Date
yesterday (Date dd mm yy)
    | dd > 1 = Date (dd - 1) mm yy
    | mm > 1 = Date (daysInMonth (mm - 1) yy) (mm - 1) yy
    | otherwise = Date 31 12 (yy - 1)

addDay :: Date -> Int -> Date
addDay date 0 = date
addDay date n
    | n > 0 = addDay (nextDay date) (n - 1)
    | n < 0 = addDay (yesterday date) (n + 1)

subDay :: Date -> Int -> Date
subDay date n = addDay date (-n)

nextMonth :: Date -> Date
nextMonth (Date dd mm yy)
    | mm < 12 = Date (min dd (daysInMonth (mm + 1) yy)) (mm + 1) yy
    | otherwise = Date (min dd (daysInMonth 1 (yy + 1))) 1 (yy + 1)

prevMonth :: Date -> Date
prevMonth (Date dd mm yy)
    | mm > 1 = Date (min dd (daysInMonth (mm - 1) yy)) (mm - 1) yy
    | otherwise = Date (min dd (daysInMonth 12 (yy - 1))) 12 (yy - 1)

addMonth :: Date -> Int -> Date
addMonth date n
    | n == 0 = date
    | n > 0 = addMonth (nextMonth date) (n - 1)
    | n < 0 = addMonth (prevMonth date) (n + 1)

subMonth :: Date -> Int -> Date
subMonth date n = addMonth date (-n)

addYear :: Date -> Int -> Date
addYear (Date dd mm yy) n
    | mm == 2 && dd == 29 && not (isLeapYear (yy + n)) = Date 28 mm (yy + n)
    | otherwise = Date dd mm (yy + n)

subYear :: Date -> Int -> Date
subYear date n = addYear date (-n)

-- 4. PREDIKAT
isEqD :: Date -> Date -> Bool
isEqD (Date dd1 mm1 yy1) (Date dd2 mm2 yy2) = 
    dd1 == dd2 && mm1 == mm2 && yy1 == yy2

isNotEqD :: Date -> Date -> Bool
isNotEqD d1 d2 = not (isEqD d1 d2)

isBefore :: Date -> Date -> Bool
isBefore (Date dd1 mm1 yy1) (Date dd2 mm2 yy2)
    | yy1 < yy2 = True
    | yy1 > yy2 = False
    | mm1 < mm2 = True
    | mm1 > mm2 = False
    | dd1 < dd2 = True
    | otherwise = False

isNext :: Date -> Date -> Bool
isNext d1 d2 = isBefore d2 d1

isBeforeN :: Date -> Date -> Int -> Bool
isBeforeN d1 d2 n = isEqD d1 (addDay d2 (-n))

isNextN :: Date -> Date -> Int -> Bool
isNextN d1 d2 n = isEqD d1 (addDay d2 n)

-- Main function
main :: IO ()
main = do
    dd1 <- readLn
    mm1 <- readLn
    yy1 <- readLn
    dd2 <- readLn
    mm2 <- readLn
    yy2 <- readLn
    n <- readLn
    
    let d1 = makeDate dd1 mm1 yy1
    let d2 = makeDate dd2 mm2 yy2
    
    putStrLn $ "d1 = " ++ show d1
    putStrLn $ "d2 = " ++ show d2
    putStrLn $ "n = " ++ show n
    putStrLn $ "nextDay(d1) = " ++ show (nextDay d1)
    putStrLn $ "nextDay(d2) = " ++ show (nextDay d2)
    putStrLn $ "yesterday(d1) = " ++ show (yesterday d1)
    putStrLn $ "yesterday(d2) = " ++ show (yesterday d2)
    putStrLn $ "addDay(d1, n) = " ++ show (addDay d1 n)
    putStrLn $ "addDay(d2, n) = " ++ show (addDay d2 n)
    putStrLn $ "subDay(d1, n) = " ++ show (subDay d1 n)
    putStrLn $ "subDay(d2, n) = " ++ show (subDay d2 n)
    putStrLn $ "nextMonth(d1) = " ++ show (nextMonth d1)
    putStrLn $ "nextMonth(d2) = " ++ show (nextMonth d2)
    putStrLn $ "prevMonth(d1) = " ++ show (prevMonth d1)
    putStrLn $ "prevMonth(d2) = " ++ show (prevMonth d2)
    putStrLn $ "addMonth(d1, n) = " ++ show (addMonth d1 n)
    putStrLn $ "addMonth(d2, n) = " ++ show (addMonth d2 n)
    putStrLn $ "subMonth(d1, n) = " ++ show (subMonth d1 n)
    putStrLn $ "subMonth(d2, n) = " ++ show (subMonth d2 n)
    putStrLn $ "addYear(d1, n) = " ++ show (addYear d1 n)
    putStrLn $ "addYear(d2, n) = " ++ show (addYear d2 n)
    putStrLn $ "subYear(d1, n) = " ++ show (subYear d1 n)
    putStrLn $ "subYear(d2, n) = " ++ show (subYear d2 n)
    putStrLn $ "isEqD(d1, d2) = " ++ show (isEqD d1 d2)
    putStrLn $ "isNotEqD(d1, d2) = " ++ show (isNotEqD d1 d2)
    putStrLn $ "isBefore(d1, d2) = " ++ show (isBefore d1 d2)
    putStrLn $ "isNext(d1, d2) = " ++ show (isNext d1 d2)
    putStrLn $ "isBeforeN(d1, d2, n) = " ++ show (isBeforeN d1 d2 n)
    putStrLn $ "isNextN(d1, d2, n) = " ++ show (isNextN d1 d2 n)
    putStrLn $ "kabisat(yy1) = " ++ show (isLeapYear (yy d1))
    putStrLn $ "kabisat(yy2) = " ++ show (isLeapYear (yy d2))