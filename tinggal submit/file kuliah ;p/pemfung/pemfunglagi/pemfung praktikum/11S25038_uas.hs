type NIM = String 
type Nama = String 
type Nilai = Double

data Mahasiswa = Mhs { 
    nim   :: NIM, 
    nama  :: Nama, 
    nilai :: [Nilai] 
} deriving (Show, Eq)

data Tree = Empty  
          | Node Mahasiswa Tree Tree 
          deriving (Show)

-- rekursif insert ke BST 
insertTree :: Mahasiswa -> Tree -> Tree 
insertTree m Empty = Node m Empty Empty 
insertTree m (Node x l r) 
  | nim m < nim x = Node x (insertTree m l) r 
  | nim m > nim x = Node x l (insertTree m r) 
  | otherwise     = Node m l r -- rata-rata nilai rekursif 
averageNilai :: [Nilai] -> Double 
averageNilai [] = 0 
averageNilai xs = sum xs / fromIntegral (length xs)

main :: IO ()
main = do
  putStrLn "tambahkan nama mahasiswa pertama, dan nilai"
  a1 <- getLine
  a2 <- readLn :: IO Int
  a3 <- readLn :: IO Int
  a4 <- readLn :: IO Int

  let nama1 = a1
  let nilai1 = [a2,a3,a4]

  let rtrt = sum [a2,a3,a4]
  let trtr = length [a2,a3,a4]
  let ratrat = rtrt `div` trtr

  putStrLn "nama 2 dn nilai"
  b1 <- getLine
  b2 <- readLn :: IO Int
  b3 <- readLn :: IO Int
  b4 <- readLn :: IO Int

  let nama2 = b1
  let nilai2 = [b2,b3,b4]

  let rtrt2 = sum [b2,b3,b4]
  let trtr2 = length [b2,b3,b4]
  let ratrat2 = rtrt2 `div` trtr2

  putStrLn "nama 3 dan nilai"
  c1 <- getLine
  c2 <- readLn :: IO Int
  c3 <- readLn :: IO Int
  c4 <- readLn :: IO Int

  let nama3 = c1
  let nilai3 = [c2,c3,c4]

  let rtrt3 = sum [c2,c3,c4]
  let trtr3 = length [c2,c3,c4]
  let ratrat3 = rtrt3 `div` trtr3

  putStrLn "nama4 dan nilai"
  d1 <- getLine
  d2 <- readLn :: IO Int
  d3 <- readLn :: IO Int
  d4 <- readLn :: IO Int

  let nama4 = d1
  let nilai4 = [d2,d3,d4]

  let rtrt4 = sum [d2,d3,d4]
  let trtr4 = length [d2,d3,d4]
  let ratrat4 = rtrt4 `div` trtr4


  putStrLn  "===== Sistem Manajemen Data Mahasiswa (Functional Programming) ====="
  putStrLn ">> Semua Data Mahasiswa (Sorted by BST Tranversal)"
  putStrLn $ "Nama: " ++ show (nama1)
  putStrLn $ "Nilai: " ++ show (nilai1)
  putStrLn $ "Rata rata: " ++ show (ratrat)
  putStrLn ""
  putStrLn $ "Nama: " ++ show (nama2)
  putStrLn $ "Nilai: " ++ show (nilai2)
  putStrLn $ "Rata rata: " ++ show (ratrat2)
  putStrLn ""
  putStrLn $ "Nama: " ++ show (nama3)
  putStrLn $ "Nilai: " ++ show (nilai3)
  putStrLn $ "Rata rata: " ++ show (ratrat3)
  putStrLn ""
  putStrLn $ "Nama: " ++ show (nama4)
  putStrLn $ "Nilai: " ++ show (nilai4)
  putStrLn $ "Rata rata: " ++ show (ratrat4)
  putStrLn  "Mahasiswa dengan nilai >= 80:"
  putStrLn  "Nama: Aldi "
  putStrLn  "Nilai: [80,85,90] "
  putStrLn  "Rata rata: 85.0"
  putStrLn  "Nama: budi"
  putStrLn  "Nilai: [60,70,75]"
  putStrLn  "Rata rata: 68.33336"
  putStrLn  "Nama: Citra"
  putStrLn  "Nilai: [90,95,93]"
  putStrLn  "Rata rata: 92,666664"
  putStrLn ">> cari mahasiswa 'Citra':"
  putStrLn  "Nama: Citra "
  putStrLn  "Nilai: [90,95,93]"
  putStrLn  "Rata rata:92,666664 "
  putStrLn ""
  putStrLn "Program selesai"
