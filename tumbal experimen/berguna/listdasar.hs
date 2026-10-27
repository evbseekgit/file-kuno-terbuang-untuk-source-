{-
    FILE: ListDasar.hs
    TUJUAN: Belajar operasi dasar list di Haskell
    CARA JALANKAN:
    1. Simpan sebagai ListDasar.hs
    2. Buka terminal: ghci ListDasar.hs
    3. Jalankan fungsi-fungsi di bawah
-}

module ListDasar where

-- ==================== 1. DEKLARASI LIST ====================

-- List angka integer
angkaGanjil :: [Int]
angkaGanjil = [1, 3, 5, 7, 9]
-- angkaGanjil adalah list yang berisi angka 1,3,5,7,9

-- List angka dengan range
angkaSatuToSepuluh :: [Int]
angkaSatuToSepuluh = [1..10]
-- [1..10] menghasilkan list [1,2,3,4,5,6,7,8,9,10]

-- List dengan step
angkaGenap :: [Int]
angkaGenap = [2, 4..20]
-- [2,4..20] menghasilkan [2,4,6,8,10,12,14,16,18,20]

-- List karakter (String adalah list Char!)
namaHewan :: String  -- Sama dengan [Char]
namaHewan = "Kucing"
-- "Kucing" = ['K','u','c','i','n','g']

-- List kosong
listKosong :: [Int]
listKosong = []
-- List tanpa elemen

-- List 2D (list dalam list)
matriks :: [[Int]]
matriks = [[1,2,3], [4,5,6], [7,8,9]]
-- List yang berisi 3 list

-- ==================== 2. OPERATOR : (CONS) ====================

-- Operator : menambahkan elemen di DEPAN list
tambahDepan :: [Int]
tambahDepan = 0 : [1,2,3]
-- Hasil: [0,1,2,3]

-- Bisa berantai
rantaiCons :: [Int]
rantaiCons = 1 : 2 : 3 : []
-- Sama dengan [1,2,3]

-- ==================== 3. FUNGSI BAWAAN LIST ====================

demoFungsiBawaan :: IO ()
demoFungsiBawaan = do
    let listContoh = [10, 20, 30, 40, 50]
    
    -- head: ambil elemen pertama
    putStrLn $ "head [10,20,30,40,50] = " ++ show (head listContoh)
    -- Output: 10
    
    -- tail: ambil semua kecuali elemen pertama
    putStrLn $ "tail [10,20,30,40,50] = " ++ show (tail listContoh)
    -- Output: [20,30,40,50]
    
    -- last: ambil elemen terakhir
    putStrLn $ "last [10,20,30,40,50] = " ++ show (last listContoh)
    -- Output: 50
    
    -- init: ambil semua kecuali elemen terakhir
    putStrLn $ "init [10,20,30,40,50] = " ++ show (init listContoh)
    -- Output: [10,20,30,40]
    
    -- length: hitung jumlah elemen
    putStrLn $ "length [10,20,30,40,50] = " ++ show (length listContoh)
    -- Output: 5
    
    -- null: cek apakah list kosong
    putStrLn $ "null [10,20,30,40,50] = " ++ show (null listContoh)
    -- Output: False
    putStrLn $ "null [] = " ++ show (null ([] :: [Int]))
    -- Output: True

-- ==================== 4. INDEXING & SLICING ====================

demoAksesElemen :: IO ()
demoAksesElemen = do
    let list = ['a','b','c','d','e']
    
    -- Operator !! untuk akses berdasarkan indeks (mulai 0)
    putStrLn $ "list !! 2 = " ++ [list !! 2]
    -- Output: 'c' (indeks ke-2)
    
    -- take: ambil n elemen pertama
    putStrLn $ "take 3 list = " ++ show (take 3 list)
    -- Output: "abc"
    
    -- drop: buang n elemen pertama
    putStrLn $ "drop 2 list = " ++ show (drop 2 list)
    -- Output: "cde"
    
    -- splitAt: bagi list menjadi dua bagian
    let (awal, akhir) = splitAt 3 list
    putStrLn $ "splitAt 3 list = " ++ show awal ++ " dan " ++ show akhir
    -- Output: "abc" dan "de"

-- ==================== 5. OPERASI LIST ====================

demoOperasiList :: IO ()
demoOperasiList = do
    let list1 = [1,2,3]
    let list2 = [4,5,6]
    
    -- ++ untuk menggabung list
    putStrLn $ "[1,2,3] ++ [4,5,6] = " ++ show (list1 ++ list2)
    -- Output: [1,2,3,4,5,6]
    
    -- concat: gabung list of lists
    let listOfLists = [[1,2], [3,4], [5,6]]
    putStrLn $ "concat [[1,2],[3,4],[5,6]] = " ++ show (concat listOfLists)
    -- Output: [1,2,3,4,5,6]
    
    -- reverse: balik urutan list
    putStrLn $ "reverse [1,2,3] = " ++ show (reverse list1)
    -- Output: [3,2,1]
    
    -- sum: jumlah semua elemen (hanya untuk angka)
    putStrLn $ "sum [1,2,3,4,5] = " ++ show (sum [1,2,3,4,5])
    -- Output: 15
    
    -- product: perkalian semua elemen
    putStrLn $ "product [1,2,3,4] = " ++ show (product [1,2,3,4])
    -- Output: 24
    
    -- maximum & minimum
    putStrLn $ "maximum [5,2,9,1] = " ++ show (maximum [5,2,9,1])
    -- Output: 9
    putStrLn $ "minimum [5,2,9,1] = " ++ show (minimum [5,2,9,1])
    -- Output: 1

-- ==================== 6. FUNGSI UTAMA ====================

-- Fungsi untuk menjalankan semua demo
main :: IO ()
main = do
    putStrLn "=== DEMO OPERASI DASAR LIST HASKELL ==="
    putStrLn ""
    
    putStrLn "1. Deklarasi List:"
    putStrLn $ "   angkaGanjil = " ++ show angkaGanjil
    putStrLn $ "   angkaSatuToSepuluh = " ++ show angkaSatuToSepuluh
    putStrLn $ "   angkaGenap = " ++ show angkaGenap
    putStrLn $ "   namaHewan = " ++ show namaHewan
    putStrLn ""
    
    putStrLn "2. Demo Fungsi Bawaan:"
    demoFungsiBawaan
    putStrLn ""
    
    putStrLn "3. Demo Akses Elemen:"
    demoAksesElemen
    putStrLn ""
    
    putStrLn "4. Demo Operasi List:"
    demoOperasiList
    putStrLn ""
    
    putStrLn "=== SELESAI ==="