-- Selektor
s1 x = x + 1
s2 x = x + 2

-- Fungsi
f1 x = x
f2 x = x * x  
f3 x = x * x * x

-- Predikat
genap x = if x > 0 && x `mod` 2 == 0 then 1.0 else 0.0
mod3 x = if x > 0 && x `mod` 3 == 0 then 1.0 else 0.0

-- Fungsi untuk membuat deret
generateSequence :: Double -> (Double -> Double) -> Double -> [Double]
generateSequence start step end
    | start > end = []
    | otherwise = start : generateSequence (step start) step end

hitungSigma a b f s
    | a > b = 0.0
    | otherwise = sum [f x | x <- generateSequence a s b]

hitungProduk a b f s
    | a > b = 1.0
    | otherwise = product [f x | x <- generateSequence a s b]

main = do
    putStrLn "=== Kalkulator Sigma Rekursif Komprehensif ==="
    a <- readLn
    b <- readLn
    
    putStrLn $ "Interval perhitungan: [" ++ show (floor a) ++ " sampai " ++ show (floor b) ++ "]"
    putStrLn "Hasil Perhitungan Semua Kombinasi Fungsi:"
    
    putStrLn $ "f(x)=x, s(x)=x+1 (Penjumlahan standar): " ++ show (hitungSigma a b f1 s1)
    putStrLn $ "f(x)=x, s(x)=x+2 (Langkah +2, Linear): " ++ show (hitungSigma a b f1 s2)
    putStrLn $ "f(x)=x^2, s(x)=x+1 (Penjumlahan kuadrat): " ++ show (hitungSigma a b f2 s1)
    putStrLn $ "f(x)=x^2, s(x)=x+2 (Langkah +2, Kuadrat): " ++ show (hitungSigma a b f2 s2)
    putStrLn $ "f(x)=x^3, s(x)=x+1 (Penjumlahan kubik): " ++ show (hitungSigma a b f3 s1)
    putStrLn $ "f(x)=x^3, s(x)=x+2 (Langkah +2, Kubik): " ++ show (hitungSigma a b f3 s2)
    
    putStrLn $ "f(x)=x, s(x)=x+1, Op=(*) (Faktorial atau Perkalian Berurutan): " ++ show (hitungProduk a b f1 s1)
    putStrLn $ "f(x)=x, s(x)=x+1, Op=(+) (Sama dengan Sigma): " ++ show (hitungSigma a b f1 s1)

    putStrLn $ "Hitung Genap: f(x)=1/0, s(x)=x+1 (Jumlah Bilangan Genap): " ++ show (hitungSigma a b (genap . floor) s1)
    putStrLn $ "Hitung Divisible by 3: f(x)=1/0, s(x)=x+1 (Jumlah Bil. Habis Dibagi 3): " ++ show (hitungSigma a b (mod3 . floor) s1)