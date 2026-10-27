-- Nama : Wesly Ambarita
-- NIM  : 11S23013

--memasukkan tipe data
isJamValid :: Int -> Int -> Int -> Bool
--memasukkan klasifikasi
isJamValid jam menit detik = jam >= 0 && jam <= 23 && menit >= 0 && menit <= 59 && detik >= 0 && detik <= 59
--menjalankankan kode program
main :: IO()
main = do

--Menginput angka
    jam <- readLn :: IO Int
    --Masukkan menit
    menit <- readLn :: IO Int
    --Masukkan detik
    detik <- readLn :: IO Int
--merealisasikan kode program
    print $ isJamValid jam menit detik