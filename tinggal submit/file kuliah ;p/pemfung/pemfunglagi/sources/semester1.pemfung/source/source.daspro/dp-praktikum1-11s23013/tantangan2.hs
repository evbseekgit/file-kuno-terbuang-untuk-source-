-- Nama : Wesly Ambarita
-- NIM  : 11S23013

-- detikToFormatJam(x) adalah fungsi untuk mengubah bilangan integer (x) sebagai detik, menjadi string jam dengan format ”j:m:d”. 
detikToFormatJam :: Int -> String
detikToFormatJam x =
    let jam = x `div` 3600
        sisaBagi = x `mod` 3600
        menit = sisaBagi `div` 60
        detik = sisaBagi `mod` 60
-- memunculkan nilai masing-masing
    in show jam ++ ":" ++ show menit ++ ":" ++ show detik 

-- memulai program
main :: IO()
main = do
    x <- readLn :: IO Int
-- memanggil fungsi detikToFormatJam
    print (detikToFormatJam x)
    

