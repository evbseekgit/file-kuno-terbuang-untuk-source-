-- Fungsi untuk memasukkan sebuah Integer ke dalam sebuah list
-- konso :: Int -> [Int] -> [Int] 
-- konso e l = e : l 

insertIntegerToList :: Int -> [Int] -> [Int]
insertIntegerToList x list = reverse ( x : list (reverse list))

-- Contoh penggunaan fungsi
main :: IO ()
main = do
    let myList = [1, 2, 3, 4, 5]
    let newValue = 6
    putStrLn "List sebelum penambahan nilai:"
    print myList
    putStrLn "Nilai yang akan dimasukkan ke dalam list:"
    print newValue
    putStrLn "List setelah penambahan nilai:"
    print (insertIntegerToList newValue myList)
