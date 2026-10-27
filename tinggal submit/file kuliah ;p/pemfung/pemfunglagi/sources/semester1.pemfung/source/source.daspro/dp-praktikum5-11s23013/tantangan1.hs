-- NAMA  : WESLY FERY WANDA AMBARITA
-- NIM   : 11S23013
-- PRODI : S1-INFORMATIKA
-- KELAS  : 11 IF-1

-- membentukan tipe data date  
data Date = Date { dd :: Int, mm :: Int, yy :: Int } deriving Show 
--mengembalikan nilai hari dari date
day :: Date -> Int 
day d = dd d
 -- > mengembalikan nilai bulan dari date
month :: Date -> Int 
month d = mm d
 -- > mengembalikan nilai tahun dari date
year :: Date -> Int 
year d = yy d
-- makeDate(dd, mm, yy) untuk membentuk Date dari hari ,bulan, dan tahun
makeDate :: Int -> Int -> Int -> Date 
makeDate a b c = Date { dd = a , mm = b , yy = c}
--Realisasi Operator -- > nextDay(d), untuk menentukan tanggal berikutnya dari Date d. 
nextDay :: Date -> Date
nextDay d =
  Date { dd = if day d == 31 && month d == 1 then 1
                else if day d == 28 && month d == 2 && kabisat then 29
                else if day d == 28 && month d == 2 then 1
                else if day d == 29 && month d == 2 && kabisat then 1
                else if day d == 31 && bulan31 then 1
                else if day d == 30 && bulan30 then 1
                else day d + 1 ,

          mm = if day d == 31 && month d == 1 then 2
                else if day d == 28 && month d == 2 && kabisat then 2
                else if day d == 28 && month d == 2 then 3
                else if day d == 29 && month d == 2 && kabisat then 3
                else if day d == 31 && month d == 12 then 1
                else if day d == 31 && bulan31 then month d + 1
                else if day d == 30 && bulan30 then month d + 1
                else month d ,

          yy = if day d == 31 && month d == 12 then year d + 1
                else year d }
  where
    kabisat = (year d `mod` 400 == 0) || ((year d `mod` 4 == 0) && (year d `mod` 100 /= 0))
    bulan30 = month d `elem` [4, 6, 9, 11]
    bulan31 = month d `elem` [1, 3, 5, 7, 8, 10, 12]
  
-- yesterday (d1) menentukan hari sebelum d1
yesterday :: Date -> Date
yesterday d =
  Date { dd = if year d-1 < 1 then 1
                else if day d == 1 && month d == 1 then 31
                else if day d == 1 && month d == 2 then 31
                else if day d == 1 && month d == 3 && kabisat then 29
                else if day d == 1 && month d == 3 then 28
                else if day d == 1 && month d == 4 then 31
                else if day d == 1 && bulan31 then 30
                else if day d == 1 && bulan30 then 31
                else day d - 1 ,

          mm = if year d-1 < 1 then 1
                else if day d == 1 && month d == 1 then 12
                else if day d == 1 then month d -1
                else month d ,

          yy = if year d-1 < 1 then 1
                else if  day d == 1 && month d == 1 then year d - 1
                else year d }
  where
    kabisat = (year d `mod` 400 == 0) || ((year d `mod` 4 == 0) && (year d `mod` 100 /= 0))
    bulan30 = month d `elem` [4, 6, 9, 11]
    bulan31 = month d `elem` [1, 3, 5, 7, 8, 10, 12]

--addDay menentukan hari setelah d1 sebanyak n buah
addDay :: Date -> Int -> Date
addDay d n = if n == 0 then d
                else addDay (nextDay d) (n - 1)

--subDay menentukan hari sebelum d1 sebanyak n buah
subDay :: Date -> Int -> Date
subDay d n = if n == 0 then d
                else subDay (yesterday d) (n-1)

--nextMonth menentukan bulan setelahnya
nextMonth :: Date -> Date
nextMonth d = Date {dd = day d , 

                    mm = if month d < 12 then month d + 1 
                            else 1 ,
                    
                    yy = if month d == 12 then year d + 1 
                            else year d}

--menentukan bulan sebelumnya
prevMonth :: Date -> Date
prevMonth d = Date {dd = if year d - 1 < 1 then 1
                            else day d  , 

                    mm = if year d - 1 < 1 then 1
                         else if month d > 1 then month d - 1 
                            else 12 ,
                    
                    yy = if year d - 1 < 1 then 1 
                         else if month d == 1 then year d - 1
                            else year d}

--menambahkan bulan sebanyak n buah
addMonth :: Date -> Int -> Date 
addMonth d n = if n == 0 then d
                else addMonth (nextMonth d) (n -1)

--mengurangi bulan sebanyak n buah
subMonth :: Date -> Int -> Date    
subMonth d n = if n == 0 then d
                else subMonth (prevMonth d) (n -1)

--menambah tahun sebanyak n buah
addYear :: Date -> Int -> Date 
addYear d n = if n == 0 then d
             else if year d + n < 0 then Date{ dd = 1,
            mm = 1,
            yy = 1}
            else Date { dd = day d,
            mm = month d ,
            yy = year d + n}

--mengurangi tahun sebanyak n buah
subYear :: Date -> Int -> Date 
subYear d n = Date { dd = if n > year d then 1
                              else day d ,
                     
                     mm = if n > year d then 1
                              else month d ,
                              
                     yy = if n > year d then 1
                              else year d - n }

 -- Realisasi Predikat -- > isEqD(d1, d2) membandingkan apakah kedua Date merupakan date yang sama baik dalam tanggal, bulan, maupun tahun. 
isEqD :: Date -> Date -> Bool 
isEqD e f = day e == day f && month e == month f && year e == year f

-- apakah kedua tanggal berbeda atau tidak
isNotEqD :: Date -> Date -> Bool  
isNotEqD e f = day e /= day f || month e /= month f || year e /= year f

 -- > isBefore(d1, d2), mengembalikan nilai benar jika tanggal d1 tepat sehari sebelum d2. 
isBefore :: Date -> Date -> Bool
isBefore e f = isEqD (yesterday f) e

-- > isNext(d1, d2), mengembalikan nilai benar jika tanggal d1 tepat sehari sesudah d2. 
isNext :: Date -> Date -> Bool -- TODO: realisasi Haskell disini 
isNext e f = isEqD (nextDay f) e

-- isBeforeN(d1, d2, n), mengembalikan nilai benar jika tanggal d1 sebelum d2 sebanyak n buah hari. 
isBeforeN :: Date -> Date -> Int -> Bool
isBeforeN e f n = isEqD (subDay f n) e

--  isNextN(d1, d2, n), mengembalikan nilai benar jika tanggal d1 sesudah d2 sebanyak n buah hari. 
isNextN :: Date -> Date -> Int -> Bool 
isNextN e f n = isEqD (addDay f n) e

       
main :: IO () 
main = do 
      dd1 <- readLn :: IO Int 
      mm1 <- readLn :: IO Int 
      yy1 <- readLn :: IO Int 
      dd2 <- readLn :: IO Int 
      mm2 <- readLn :: IO Int 
      yy2 <- readLn :: IO Int 
      n   <- readLn :: IO Int
      
       -- mendeklarasikan date 
      let d1 = makeDate dd1 mm1 yy1 
          d2 = makeDate dd2 mm2 yy2 
   
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

--THANK YOU















































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
