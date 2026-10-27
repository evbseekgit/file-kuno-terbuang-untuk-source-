-- Tipe data untuk pecahan
data Pecahan = Pecahan { a :: Int, b :: Int } deriving (Show)

-- Konstruktor
-- makeP (a,b) untuk membentuk pecahan dari dua buah bilangan bulat (Integer)
makeP :: Int -> Int -> Pecahan
makeP a b
    | b == 0    = Pecahan 0 0
    | otherwise = Pecahan a b    

-- Selektor
-- pemb (P) untuk mengembalikan nilai pembilang (a) dari pecahan P
pemb :: Pecahan -> Int
pemb (Pecahan a _) = a

-- peny (P) untuk mengembalikan nilai penyebut (b) dari pecahan P
peny :: Pecahan -> Int
peny (Pecahan _ b) = b

-- Fungsi untuk menyederhanakan pecahan
sederhana :: Pecahan -> Pecahan
sederhana (Pecahan a b)
    | a == 0 = Pecahan 0 0
    | otherwise = Pecahan (a `div` d) (b `div` d)
  where d = gcd a b

-- Fungsi untuk mengubah pecahan ke float
toFloat :: Pecahan -> Float
toFloat (Pecahan a b)
    | b == 0 = 0.0
    | otherwise = fromIntegral a / fromIntegral b

-- Operator
-- addP (p1, p2) untuk melakukan penambahan antara dua pecahan (p1 + p2)
addP :: Pecahan -> Pecahan -> Pecahan
addP p1 p2 = Pecahan (pemb p1 * peny p2 + pemb p2 * peny p1) (peny p1 * peny p2)

-- subP (p1, p2) untuk melakukan pengurangan antara dua pecahan (p1 - p2)
subP :: Pecahan -> Pecahan -> Pecahan
subP p1 p2 = Pecahan (pemb p1 * peny p2 - pemb p2 * peny p1) (peny p1 * peny p2)

-- mulP (p1, p2) untuk melakukan pengalian antara dua pecahan (p1 * p2)
mulP :: Pecahan -> Pecahan -> Pecahan
mulP p1 p2 = Pecahan (pemb p1 * pemb p2) (peny p1 * peny p2)

-- divP (p1, p2) untuk melakukan pembagian antara dua pecahan (p1 / p2)
divP :: Pecahan -> Pecahan -> Pecahan
divP p1 p2
    | pemb p2 == 0 = Pecahan 0 0
    | otherwise    = Pecahan (pemb p1 * peny p2) (peny p1 * pemb p2)

-- Predikat (operator relasional pecahan)
-- isEqP (p1, p2) untuk melakukan perbandingan, apakah kedua pecahan memiliki nilai yang sama
isEqP :: Pecahan -> Pecahan -> Bool
isEqP p1 p2 = 
    (pemb p1 * peny p2) == (pemb p2 * peny p1)

-- isLtP (p1, p2) untuk memeriksa apakah p1 < p2
isLtP :: Pecahan -> Pecahan -> Bool
isLtP p1 p2 = 
    toFloat p1 < toFloat p2

-- run code
main :: IO ()
main = do
    a1 <- readLn :: IO Int 
    b1 <- readLn :: IO Int
    a2 <- readLn :: IO Int
    b2 <- readLn :: IO Int
    let p1 = makeP a1 b1
    let p2 = makeP a2 b2

    putStrLn $ "p1 = " ++ show p1
    putStrLn $ "sederhana(p1) = " ++ show (sederhana p1)
    putStrLn $ "toFloat(p1) = " ++ show (toFloat p1)
    putStrLn $ "p2 = " ++ show p2
    putStrLn $ "sederhana(p2) = " ++ show (sederhana p2)
    putStrLn $ "toFloat(p2) = " ++ show (toFloat p2)
    
    let tambah = addP p1 p2
    putStrLn $ "addP(p1, p2) = " ++ show tambah
    putStrLn $ "sederhana(addP(p1, p2)) = " ++ show (sederhana tambah)
    putStrLn $ "toFloat(addP(p1, p2)) = " ++ show (toFloat tambah)
    
    let kurang = subP p1 p2
    putStrLn $ "subP(p1, p2) = " ++ show kurang
    putStrLn $ "sederhana(subP(p1, p2)) = " ++ show (sederhana kurang)
    putStrLn $ "toFloat(subP(p1, p2)) = " ++ show (toFloat kurang)
    
    let kali = mulP p1 p2
    putStrLn $ "mulP(p1, p2) = " ++ show kali
    putStrLn $ "sederhana(mulP(p1, p2)) = " ++ show (sederhana kali)
    putStrLn $ "toFloat(mulP(p1, p2)) = " ++ show (toFloat kali)
    
    let bagi = divP p1 p2
    putStrLn $ "divP(p1, p2) = " ++ show bagi
    putStrLn $ "sederhana(divP(p1, p2)) = " ++ show (sederhana bagi)
    putStrLn $ "toFloat(divP(p1, p2)) = " ++ show (toFloat bagi)
    
    putStrLn $ "isEqP(p1, p2) = " ++ show (isEqP p1 p2)
    putStrLn $ "isLtP(p1, p2) = " ++ show (isLtP p1 p2)