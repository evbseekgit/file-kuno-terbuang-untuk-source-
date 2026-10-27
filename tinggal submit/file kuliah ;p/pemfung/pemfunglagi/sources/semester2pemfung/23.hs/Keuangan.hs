module Keuangan where

import Data.Time (Day, parseTimeM, defaultTimeLocale)

-- Tipe Data untuk Transaksi
data Transaksi = Transaksi 
  { tanggal  :: String  -- Tanggal Transaksi dalam format YYYY-MM-DD
  , deskripsi :: String -- Deskripsi Transaksi
  , jumlah   :: Double  -- Jumlah Uang (positif untuk pemasukan, negatif untuk pengeluaran)
  } deriving Show

-- Tipe Data untuk Akun
data Akun = Akun 
  { namaPemilik :: String        -- Nama Pemilik Akun 
  , saldoAwal   :: Double        -- Saldo Awal Akun (tidak berubah)
  , saldoAkhir  :: Double        -- Saldo Akhir Akun (terupdate)
  , riwayat     :: [Transaksi]   -- Daftar Transaksi yang telah dilakukan
  } deriving Show

-- Fungsi untuk validasi format tanggal
validasiTanggal :: String -> Bool
validasiTanggal str = case parseTimeM True defaultTimeLocale "%Y-%m-%d" str :: Maybe Day of
  Just _ -> True
  Nothing -> False

-- Fungsi untuk Membuat Transaksi dengan Validasi
buatTransaksi :: String -> String -> Double -> Maybe Transaksi
buatTransaksi tgl desc amt
  | not (validasiTanggal tgl) = Nothing
  | otherwise = Just $ Transaksi tgl desc amt

-- Fungsi untuk Membuat Transaksi Tanpa Validasi (untuk keperluan testing)
buatTransaksiTanpaValidasi :: String -> String -> Double -> Transaksi
buatTransaksiTanpaValidasi tgl desc amt = Transaksi tgl desc amt

-- Fungsi untuk Menambahkan Transaksi ke Akun
tambahTransaksi :: Transaksi -> Akun -> Akun
tambahTransaksi t akun = 
  let newSaldoAkhir = saldoAkhir akun + jumlah t
  in akun 
    { riwayat = t : riwayat akun
    , saldoAkhir = newSaldoAkhir
    }

-- Fungsi untuk membuat Akun baru
buatAkun :: String -> Double -> Akun
buatAkun nama saldoAwal = Akun nama saldoAwal saldoAwal []

-- Fungsi untuk Menghitung Saldo dari Riwayat Transaksi
hitungSaldoDariRiwayat :: Akun -> Double
hitungSaldoDariRiwayat akun = 
  saldoAwal akun + sum (map jumlah (riwayat akun))

-- Fungsi untuk Memfilter Transaksi Berdasarkan Rentang Tanggal
filterTransaksiByDate :: String -> String -> Akun -> [Transaksi]
filterTransaksiByDate startDate endDate akun =
  filter (\t -> tanggal t >= startDate && tanggal t <= endDate) (riwayat akun)

-- Fungsi untuk Menghitung Total Pemasukan
totalPemasukan :: Akun -> Double
totalPemasukan akun = 
  sum [jumlah t | t <- riwayat akun, jumlah t > 0]

-- Fungsi untuk Menghitung Total Pengeluaran
totalPengeluaran :: Akun -> Double
totalPengeluaran akun = 
  sum [jumlah t | t <- riwayat akun, jumlah t < 0]

-- Fungsi untuk Menampilkan Detail Akun
getDetailAkun :: Akun -> String
getDetailAkun akun = 
  "Nama Pemilik: " ++ namaPemilik akun ++ "\n" ++
  "Saldo Awal: " ++ show (saldoAwal akun) ++ "\n" ++
  "Saldo Akhir: " ++ show (saldoAkhir akun) ++ "\n" ++
  "Total Pemasukan: " ++ show (totalPemasukan akun) ++ "\n" ++
  "Total Pengeluaran: " ++ show (abs (totalPengeluaran akun)) ++ "\n" ++
  "Jumlah Transaksi: " ++ show (length (riwayat akun)) ++ "\n" ++
  "Riwayat Transaksi (terbaru ke terlama):\n" ++ 
  unlines (map formatTransaksi (reverse (riwayat akun)))
  where
    formatTransaksi t = 
      "  [" ++ tanggal t ++ "] " ++ deskripsi t ++ ": " ++ 
      (if jumlah t >= 0 then "+" else "") ++ show (jumlah t)

-- Fungsi untuk Menampilkan Riwayat Transaksi dengan Format Rapih
tampilkanRiwayat :: Akun -> String
tampilkanRiwayat akun =
  "Riwayat Transaksi untuk " ++ namaPemilik akun ++ ":\n" ++
  "========================================\n" ++
  "Tanggal       Deskripsi                Jumlah\n" ++
  "----------------------------------------\n" ++
  unlines (map formatTransaksiTable (reverse (riwayat akun))) ++
  "========================================"
  where
    formatTransaksiTable t =
      take 10 (tanggal t ++ repeat ' ') ++ " " ++
      take 25 (deskripsi t ++ repeat ' ') ++ " " ++
      (if jumlah t >= 0 then " " else "") ++ 
      take 10 (show (jumlah t) ++ repeat ' ')

-- Contoh Program Utama
main :: IO ()
main = do
  putStrLn "=== Sistem Manajemen Keuangan ===\n"
  
  -- Membuat Akun dengan saldo awal
  let akunAwal = buatAkun "John Doe" 1000.0
  
  putStrLn "1. Membuat transaksi dengan validasi tanggal..."
  
  -- Membuat Transaksi dengan validasi
  case buatTransaksi "2024-11-01" "Pemasukan Gaji" 2000.0 of
    Nothing -> putStrLn "Error: Format tanggal transaksi 1 tidak valid!"
    Just transaksi1 -> do
      putStrLn "Transaksi 1 berhasil dibuat"
      
      case buatTransaksi "2024-11-05" "Pengeluaran Belanja" (-500.0) of
        Nothing -> putStrLn "Error: Format tanggal transaksi 2 tidak valid!"
        Just transaksi2 -> do
          putStrLn "Transaksi 2 berhasil dibuat"
          
          case buatTransaksi "2024-11-10" "Bayar Listrik" (-300.0) of
            Nothing -> putStrLn "Error: Format tanggal transaksi 3 tidak valid!"
            Just transaksi3 -> do
              putStrLn "Transaksi 3 berhasil dibuat"
              
              -- Menambahkan Transaksi ke Akun
              let akun1 = tambahTransaksi transaksi1 akunAwal
              let akun2 = tambahTransaksi transaksi2 akun1
              let akunFinal = tambahTransaksi transaksi3 akun2
              
              -- Menampilkan Detail Akun
              putStrLn "\n2. Detail Akun:"
              putStrLn "----------------------------------------"
              putStrLn (getDetailAkun akunFinal)
              
              -- Menampilkan riwayat dalam format tabel
              putStrLn "\n3. Tabel Riwayat Transaksi:"
              putStrLn (tampilkanRiwayat akunFinal)
              
              -- Menampilkan summary
              putStrLn "\n4. Summary:"
              putStrLn $ "Saldo awal: " ++ show (saldoAwal akunFinal)
              putStrLn $ "Saldo akhir: " ++ show (saldoAkhir akunFinal)
              putStrLn $ "Selisih: " ++ show (saldoAkhir akunFinal - saldoAwal akunFinal)
              
              -- Test filter transaksi berdasarkan tanggal
              putStrLn "\n5. Transaksi antara 2024-11-01 hingga 2024-11-05:"
              let filtered = filterTransaksiByDate "2024-11-01" "2024-11-05" akunFinal
              mapM_ (putStrLn . show) filtered
              
              -- Test transaksi dengan tanggal tidak valid
              putStrLn "\n6. Test transaksi dengan tanggal tidak valid:"
              case buatTransaksi "2024-13-01" "Test Invalid" 100.0 of
                Nothing -> putStrLn "✓ Berhasil menangani tanggal tidak valid"
                Just _ -> putStrLn "✗ Gagal menangani tanggal tidak valid"
  
  -- Contoh tanpa validasi (untuk keperluan testing cepat)
  putStrLn "\n=== Contoh tanpa validasi (testing) ==="
  let transaksiTest = buatTransaksiTanpaValidasi "2024-11-15" "Bonus" 1000.0
  let akunTest = buatAkun "Jane Doe" 500.0
  let akunTestFinal = tambahTransaksi transaksiTest akunTest
  putStrLn (getDetailAkun akunTestFinal)