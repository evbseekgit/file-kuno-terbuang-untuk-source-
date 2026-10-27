main :: IO ()
main = do
    putStrLn "Masukkan 4 angka:"
    
    a1 <- readLn
    a2 <- readLn
    a3 <- readLn
    a4 <- readLn
    
    let list = [a1, a2, a3, a4]
    
    putStrLn $ "\nList: " ++ show list
    putStrLn $ "head: " ++ show (head list)
    putStrLn $ "head tail: " ++ show (head (tail list))
    