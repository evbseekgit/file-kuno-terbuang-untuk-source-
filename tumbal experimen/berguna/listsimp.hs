-- File paling sederhana tanpa module
-- Simpan sebagai ListSimple.hs

-- DEKLARASI LIST
angka :: [Int]
angka = [1, 2, 3, 4, 5]

nama :: [String]
nama = ["Budi", "Ani", "Citra"]

huruf :: [Char]
huruf = ['H', 'A', 'S', 'K', 'E', 'L', 'L']

kosong :: [Int]
kosong = []

-- FUNGSI UTAMA
main = do
    putStrLn "=== MENAMPILKAN LIST ==="
    putStrLn ""
    
    putStrLn "1. List angka:"
    print angka
    
    putStrLn "\n2. List nama:"
    print nama
    
    putStrLn "\n3. List huruf:"
    print huruf
    
    putStrLn "\n4. String (list Char):"
    print "HASKELL"
    
    putStrLn "\n5. List kosong:"
    print kosong