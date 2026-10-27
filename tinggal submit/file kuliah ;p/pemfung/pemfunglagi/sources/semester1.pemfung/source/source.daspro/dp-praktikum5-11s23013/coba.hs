-- Definisi tipe data Jam
data Jam = Jam { jam :: Int, menit :: Int, detik :: Int } deriving Show

-- Konstruktor untuk membuat jam
makeJam :: Int -> Int -> Int -> Jam
makeJam hh mm ss = Jam { jam = hh, menit = mm, detik = ss }

-- Selektor untuk mendapatkan nilai jam, menit, dan detik dari Jam
hour :: Jam -> Int
hour (Jam h _ _) = h

minute :: Jam -> Int
minute (Jam _ m _) = m

second :: Jam -> Int
second (Jam _ _ s) = s

-- Operator untuk mengubah jam menjadi detik dan sebaliknya
hourToSecond :: Jam -> Int
hourToSecond j = (hour j * 3600) + (minute j * 60) + second j

secondToHour :: Int -> Jam
secondToHour totalDetik =
    let (jam', sisaDetik) = totalDetik `divMod` 3600
        (menit', detik') = sisaDetik `divMod` 60
    in makeJam jam' menit' detik'

-- Fungsi untuk mengonversi format waktu 24 jam menjadi format 12 jam
convert24To12 :: Jam -> String
convert24To12 j =
    let hh = hour j
        mm = minute j
        ss = second j
        meridian = if hh < 12 then "AM" else "PM"
        jam12 = mod hh 12
        jam12' = if jam12 == 0 then 12 else jam12
        jamStr = if jam12' < 10 then "0" ++ show jam12' else show jam12'
        menitStr = if mm < 10 then "0" ++ show mm else show mm
        detikStr = if ss < 10 then "0" ++ show ss else show ss
    in jamStr ++ ":" ++ menitStr ++ ":" ++ detikStr ++ " " ++ meridian

-- Fungsi untuk mengonversi format waktu 12 jam menjadi format 24 jam
convert12To24 :: String -> Jam
convert12To24 waktu12 =
    let (jamStr, sisa) = break (== ':') waktu12
        (menitStr, sisa') = break (== ':') (tail sisa)
        (detikStr, meridian) = break (== ' ') (tail sisa')
        jam = read jamStr :: Int
        menit' = read menitStr :: Int
        detik' = read detikStr :: Int
        jam' = if meridian == "PM" && jam /= 12 then jam + 12 else if meridian == "AM" && jam == 12 then 0 else jam
    in makeJam jam' menit' detik'

-- Fungsi untuk menambahkan dua jam
addHours :: Jam -> Jam -> Jam
addHours j1 j2 = secondToHour (hourToSecond j1 + hourToSecond j2)

-- Fungsi untuk mengurangkan dua jam
subHours :: Jam -> Jam -> Jam
subHours j1 j2 = secondToHour (abs (hourToSecond j1 - hourToSecond j2))

-- Predikat untuk membandingkan apakah dua jam sama atau tidak sama
isEqD :: Jam -> Jam -> Bool
isEqD j1 j2 = hourToSecond j1 == hourToSecond j2

isNotEqD :: Jam -> Jam -> Bool
isNotEqD j1 j2 = hourToSecond j1 /= hourToSecond j2

-- Test case
testCases :: [Jam]
testCases = [makeJam 8 0 0, makeJam 16 0 0, makeJam 12 0 0, makeJam 24 0 0]

-- Fungsi utama untuk menjalankan pengujian
main :: IO ()
main = do
    putStrLn "convert24To12:"
    mapM_ (putStrLn . convert24To12) testCases

    putStrLn "\nconvert12To24:"
    let testCases12 = ["08:00:00 AM", "04:00:00 PM", "12:00:00 PM", "12:00:00 AM"]
    mapM_ (print . convert12To24) testCases12

    putStrLn "\naddHours:"
    let j1 = makeJam 8 0 0
        j2 = makeJam 13 0 0
    print $ addHours j1 j2

    putStrLn "\nsubHours:"
    let j3 = makeJam 12 0 0
        j4 = makeJam 8 0 0
    print $ subHours j3 j4

    putStrLn "\nisEqD and isNotEqD:"
    let j5 = makeJam 8 0 0
        j6 = makeJam 8 0 0
        j7 = makeJam 12 0 0
    print $ isEqD j5 j6
    print $ isNotEqD j5 j7
