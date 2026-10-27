-- Selektor
increment = \x -> x + 1

-- Operator Sesuai Modul
sigmaPlus :: (Float -> Float) -> (Float -> Float) -> Float -> Float -> Float
sigmaPlus f s a b =
    if a > b then 0 else f a + sigmaPlus f s (s a) b
sigmaTimes f s a b =
    if a > b then 1 else f a * sigmaTimes f s (s a) b
faktorial a b          = sigmaTimes (\x -> x) (\x -> x + 1) a b
penjumlahanBerurut a b = sigmaPlus  (\x -> x) (\x -> x + 1) a b

-- Predikat
predGenap x = if round x `mod` 2 == 0 then 1 else 0
predMod3  x = if round x `mod` 3 == 0 then 1 else 0

countGenap a b = sigmaPlus predGenap increment a b
countMod3  a b = sigmaPlus predMod3  increment a b

-- MAIN
main = do
    a <- readLn :: IO Float
    b <- readLn :: IO Float
    putStrLn $ "Interval perhitungan: [" ++ show a ++ " sampai " ++ show b ++ "]"

    putStrLn "Hasil Perhitungan Semua Kombinasi Fungsi:"
    -- 1. f(x)=x, s(x)=x+1
    print $ sigmaPlus (\x -> x) (\x -> x + 1) a b

    -- 2. f(x)=x, s(x)=x+2
    print $ sigmaPlus (\x -> x) (\x -> x + 2) a b

    -- 3. f(x)=x^2, s(x)=x+1
    print $ sigmaPlus (\x -> x*x) (\x -> x + 1) a b

    -- 4. f(x)=x^2, s(x)=x+2
    print $ sigmaPlus (\x -> x*x) (\x -> x + 2) a b

    -- 5. f(x)=x^3, s(x)=x+1
    print $ sigmaPlus (\x -> x*x*x) (\x -> x + 1) a b

    -- 6. f(x)=x^3, s(x)=x+2
    print $ sigmaPlus (\x -> x*x*x) (\x -> x + 2) a b
    
    -- Faktorial (perkalian berurut)
    print $ sigmaTimes (\x -> x) (\x -> x + 1) a b

    -- Penjumlahan berurut (sigma)
    print $ sigmaPlus (\x -> x) (\x -> x + 1) a b

    -- Hitung bilangan genap
    print $ sigmaPlus predGenap (\x -> x + 1) a b

    -- Hitung bilangan habis dibagi 3
    print $ sigmaPlus predMod3 (\x -> x + 1) a b

    putStrLn $ "Faktorial/Perkalian Berurut: " ++ show (faktorial a b)
    putStrLn $ "Penjumlahan Berurut: " ++ show (penjumlahanBerurut a b)
    putStrLn $ "Jumlah Bilangan Genap: " ++ show (countGenap a b)
    putStrLn $ "Jumlah Bil. Habis Dibagi 3: " ++ show (countMod3 a b)