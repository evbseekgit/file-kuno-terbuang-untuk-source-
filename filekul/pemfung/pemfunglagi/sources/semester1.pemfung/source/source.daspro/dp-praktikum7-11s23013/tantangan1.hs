-- NAMA  : WESLY FERY WANDA AMBARITA
-- NIM   : 11S23013
-- PRODI : INFORMATIKA
-- KELAS : 11IF1

-- Definisi Pohon Biner 
data Tree t = Empty | Node t (Tree t) (Tree t) deriving (Show)

makeTree :: [Int] -> Tree Int 
-- TODO: realisasi Haskell disini
makeTree [] = Empty
makeTree (x:xs) = Node x (makeTree leftTail) (makeTree rightTail) 
                where
                  panjang = length xs
                  mid = panjang  `div` 2
                  (leftTail, rightTail) = splitAt (if panjang `mod` 2 == 0 then mid else mid + 1)(xs)

-- > akar(p), adalah akar dari p. Jika p adalah /a,l,r\ maka akar(p) adalah a. 
akar :: Tree t -> t
akar (Node a _ _) = a

-- > left(p), adalah sub pohon kiri dari p. Jika p adalah /a,l,r\ maka left(p) = l
left :: Tree t -> Tree t
left (Node _ l _) = l

-- > right(p), adalah sub pohon kanan dari p. Jika p adalah /a,l,r\ maka right(p) = r. 
right :: Tree t -> Tree t
right (Node _ _ r) = r

-- Operator -- > nbElmt(p), memberikan banyaknya elemen dari pohon p. 
nbElmt :: Tree t -> Int 
nbElmt Empty = 0
nbElmt (Node _ l r) = 1 +  nbElmt l + nbElmt r

-- > nbDaun(p), memberikan banyaknya daun dari pohon p. 
nbDaun :: Tree t -> Int -- TODO: realisasi Haskell disini 
nbDaun Empty = 0
nbDaun (Node _ Empty Empty) = 1 -- Node tanpa anak merupakan daun
nbDaun (Node _ l r) = nbDaun l + nbDaun r

-- > nbEven(p), menghitung banyaknya bilangan genap pada pohon p.
nbEven :: Integral t => Tree t -> Int
nbEven Empty = 0
nbEven (Node a l r) = if a `mod` 2 == 0
                      then 1 + nbEven l + nbEven r
                        else nbEven l + nbEven r

-- > nbOdd(p), menghitung banyaknya bilangan ganjil pada pohon p.
nbOdd :: Integral t => Tree t -> Int
nbOdd Empty = 0
nbOdd (Node a l r) = if a `mod` 2 /= 0
                      then 1 + nbOdd l + nbOdd r
                        else nbOdd l + nbOdd r

-- > isTreeEmpty(p), adalah benar jika p kosong: (//  \\). 
isTreeEmpty :: Tree t -> Bool -- TODO: realisasi Haskell disini 
isTreeEmpty (Node _ _ _) = False
isTreeEmpty Empty = True

-- > isOneElemt(p), adalah benar jika p hanya mempunyai satu elemen, yaitu akar: (// a \\). 
isOneElemt :: Tree t -> Bool -- TODO: realisasi Haskell disini 
isOneElemt (Node a Empty Empty) = True
isOneElemt (Node a l Empty) = False
isOneElemt (Node a Empty r) = False
isOneElemt (Node a l r) = False

-- > isUnerLeft(p) adalah benar jika p hanya mengandung sub pohon kiri tidak kosong: (// a l \\). 
isUnerLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
isUnerLeft p = if nbElmt p == 2 then True
                  else False

-- isUnerLeft Empty = False
-- isUnerLeft (Node a l r) = False
-- isUnerLeft (Node a Empty r) = False
-- isUnerLeft (Node a l Empty) && nbElmt l == 2 = True

-- > isUnerRight(p) adalah benar jika p hanya mengandung sub pohon kanan tidak kosong: (// a r \\). 
isUnerRight :: Tree t -> Bool 
isUnerRight p = False

-- > isBiner(p) adalah benar jika p mengandung sub pohon kiri dan sub pohon kanan: (// a l r \\). 
isBiner :: Tree t -> Bool 
isBiner Empty = False
isBiner (Node a l Empty) = isBiner l
isBiner (Node a Empty r) = isBiner r
isBiner (Node a l r) = True

-- > isExitLeft(p) adalah benar jika p mengandung sub pohon kiri. 
isExitLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
isExitLeft Empty = False
isExitLeft (Node _ Empty _ ) = False
isExitLeft (Node _ l _ ) = True

-- > isExitRight(p) adalah benar jika p mengandung sub pohon kanan. 
isExitRight :: Tree t -> Bool -- TODO: realisasi Haskell disini 
isExitRight Empty = False
isExitRight (Node _ _ Empty) = False
isExitRight (Node _ _ r ) = True

-- > isExistN(p, n) adalah benar jika p mengandung bilangan n. 
isExistN :: Tree Int -> Int -> Bool -- TODO: realisasi Haskell disini 
isExistN p n = if nbElmt p == 1 then n == akar p
                else if nbElmt p == 2 then n == akar p || isExistN (left p) n 
                else if nbElmt p > 3 then n == akar p || isExistN (right p) n || isExistN (left p) n
                else False 

-- > isBalance(p) adalah benar jika p mengandung sub pohon kiri dan kanan dengan jumlah yang sama banyak. 
isBalance :: Tree Int -> Bool 
isBalance (Node a l r) = nbElmt l == nbElmt r

-- Fungsi lainnya 
getListFromInput :: Int -> IO [Int] 
getListFromInput 0 = return [] 
getListFromInput n = do 
  x <- readLn :: IO Int 
  xs <- getListFromInput (n - 1) 
  return (x : xs) 
 
showTree :: Show t => Tree t -> String 
showTree tree = unlines (showTree' tree) 
 
showTree' :: Show t => Tree t -> [String] 
showTree' Empty = ["_"] 
showTree' (Node a l r)

  | isTreeEmpty l && isTreeEmpty r = [show a] 
  | otherwise = show a : zipWith (\l r -> l ++ " " ++ r) 
                      (showTree' l) 
                      (showTree' r) 
 
main :: IO () 
main = do 
  totalList <- readLn :: IO Int 
  list <-  getListFromInput totalList 
 
  let p = makeTree list 
  let emptyTree = isTreeEmpty p 
 
  if not emptyTree  
    then do 
 
      n <- readLn :: IO Int 
      putStrLn $ "n = " ++ show n 
 
      -- memanggil fungsi showTree(p) 
      putStrLn "tree p : " 
      putStrLn $ showTree p 
 
      -- memanggil fungsi akar(p) 
      putStrLn $ "akar(p) = " ++ show (akar p :: Int) 
 
      -- memanggil fungsi left(p) 
      putStrLn "left(p) =" 
      putStrLn $ showTree (left p) 
 
      -- memanggil fungsi right(p) 
      putStrLn "right(p) =" 
      putStrLn $ showTree (right p) 
 
      -- memanggil fungsi nbElmt(p) 
      putStrLn $ "nbElmt(p) = " ++ show (nbElmt p) 
 
      -- memanggil fungsi nbDaun(p) 
      putStrLn $ "nbDaun(p) = " ++ show (nbDaun p) 
 
      -- memanggil fungsi nbEven(p) 
      putStrLn $ "nbEven(p) = " ++ show (nbEven p) 
 
      -- memanggil fungsi nbOdd(p) 
      putStrLn $ "nbOdd(p) = " ++ show (nbOdd p)

      -- memanggil fungsi isTreeEmpty(p) 
      putStrLn $ "isTreeEmpty(p) = " ++ show (isTreeEmpty p) 
 
      -- memanggil fungsi isOneElemt(p) 
      putStrLn $ "isOneElemt(p) = " ++ show (isOneElemt p) 
 
      -- memanggil fungsi isUnerLeft(p) 
      putStrLn $ "isUnerLeft(p) = " ++ show (isUnerLeft p) 
 
      -- memanggil fungsi isUnerRight(p) 
      putStrLn $ "isUnerRight(p) = " ++ show (isUnerRight p) 
 
      -- memanggil fungsi isBiner(p) 
      putStrLn $ "isBiner(p) = " ++ show (isBiner p) 
 
      -- memanggil fungsi isExitLeft(p) 
      putStrLn $ "isExitLeft(p) = " ++ show (isExitLeft p) 
 
      -- memanggil fungsi isExitRight(p) 
      putStrLn $ "isExitRight(p) = " ++ show (isExitRight p) 
 
      -- memanggil fungsi isExistN(p, n) 
      putStrLn $ "isExistN(p, n) = " ++ show (isExistN p n) 
 
      -- memanggil fungsi isBalance(p) 
      putStrLn $ "isBalance(p) = " ++ show (isBalance p) 
 
    else putStrLn "Ini pohon kosong!"

    //wesly fery wanda ambarita






















































































































































































































































































































--     -- NAMA  : WESLY FERY WANDA AMBARITA
-- -- NIM   : 11S23013
-- -- PRODI : INFORMATIKA
-- -- KELAS : 11IF1

-- -- Definisi Pohon Biner 
-- data Tree t = Empty | Node t (Tree t) (Tree t) deriving (Show)

-- makeTree :: [Int] -> Tree Int 
-- -- TODO: realisasi Haskell disini
-- makeTree [] = Empty
-- makeTree (x:xs) = Node x (makeTree leftTail) (makeTree rightTail) 
--                 where
--                   panjang = length xs
--                   mid = panjang  `div` 2
--                   (leftTail, rightTail) = splitAt (if panjang `mod` 2 == 0 then mid else mid + 1)(xs)

-- akar :: Tree t -> t
-- akar (Node a _ _) = a

-- left :: Tree t -> Tree t
-- left (Node _ l _) = l

-- right :: Tree t -> Tree t
-- right (Node _ _ r) = r

-- -- Operator -- > nbElmt(p), memberikan banyaknya elemen dari pohon p. 
-- nbElmt :: Tree t -> Int 
-- nbElmt Empty = 0
-- nbElmt (Node _ l r) = 1 +  nbElmt l + nbElmt r

-- -- > nbDaun(p), memberikan banyaknya daun dari pohon p. 
-- nbDaun :: Tree t -> Int -- TODO: realisasi Haskell disini 
-- nbDaun Empty = 0
-- nbDaun (Node _ Empty Empty) = 1 -- Node tanpa anak merupakan daun
-- nbDaun (Node _ l r) = nbDaun l + nbDaun r

-- nbEven :: Integral t => Tree t -> Int
-- nbEven Empty = 0
-- nbEven (Node a l r) = if a `mod` 2 == 0
--                       then 1 + nbEven l + nbEven r
--                         else nbEven l + nbEven r

-- nbOdd :: Integral t => Tree t -> Int
-- nbOdd Empty = 0
-- nbOdd (Node a l r) = if a `mod` 2 /= 0
--                       then 1 + nbOdd l + nbOdd r
--                         else nbOdd l + nbOdd r

-- -- > isTreeEmpty(p), adalah benar jika p kosong: (//  \\). 
-- isTreeEmpty :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isTreeEmpty (Node _ _ _) = False
-- isTreeEmpty Empty = True

-- isOneElemt :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isOneElemt (Node a Empty Empty) = True
-- isOneElemt (Node a l Empty) = False
-- isOneElemt (Node a Empty r) = False
-- isOneElemt (Node a l r) = False

-- -- > isUnerLeft(p) adalah benar jika p hanya mengandung sub pohon kiri tidak kosong: (// a l \\). 
-- isUnerLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isUnerLeft p = if nbElmt p == 2 then True
--                   else False

-- -- isUnerLeft Empty = False
-- -- isUnerLeft (Node a l r) = False
-- -- isUnerLeft (Node a Empty r) = False
-- -- isUnerLeft (Node a l Empty) && nbElmt l == 2 = True

-- -- > isUnerRight(p) adalah benar jika p hanya mengandung sub pohon kanan tidak kosong: (// a r \\). 
-- isUnerRight :: Tree t -> Bool 
-- isUnerRight Empty = False
-- isUnerRight (Node a l r) = False
-- isUnerRight (Node a Empty r) = True
-- isUnerRight (Node a l Empty) = False

-- -- isUnerRight :: Tree t -> Bool 
-- -- isUnerRight p = False

-- -- > isBiner(p) adalah benar jika p mengandung sub pohon kiri dan sub pohon kanan: (// a l r \\). 
-- isBiner :: Tree t -> Bool 
-- isBiner Empty = False
-- isBiner (Node a l Empty) = isBiner l
-- isBiner (Node a Empty r) = isBiner r
-- isBiner (Node a l r) = True

-- -- > isExitLeft(p) adalah benar jika p mengandung sub pohon kiri. 
-- isExitLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isExitLeft Empty = False
-- isExitLeft (Node _ Empty _ ) = False
-- isExitLeft (Node _ l _ ) = True

-- -- > isExitRight(p) adalah benar jika p mengandung sub pohon kiri. 
-- isExitRight :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isExitRight Empty = False
-- isExitRight (Node _ _ Empty) = False
-- isExitRight (Node _ r _ ) = True

-- -- > isExistN(p, n) adalah benar jika p mengandung bilangan n. 
-- isExistN :: Tree Int -> Int -> Bool -- TODO: realisasi Haskell disini 
-- isExistN p n = if nbElmt p == 1 then n == akar p
--                 else if nbElmt p == 2 then n == akar p || isExistN (left p) n 
--                 else if nbElmt p > 3 then n == akar p || isExistN (right p) n || isExistN (left p) n
--                 else False 

-- -- > isBalance(p) adalah benar jika p mengandung sub pohon kiri dan kanan dengan jumlah yang sama banyak. 
-- isBalance :: Tree Int -> Bool 
-- isBalance (Node a l r) = nbElmt l == nbElmt r

-- -- Fungsi lainnya 
-- getListFromInput :: Int -> IO [Int] 
-- getListFromInput 0 = return [] 
-- getListFromInput n = do 
--   x <- readLn :: IO Int 
--   xs <- getListFromInput (n - 1) 
--   return (x : xs) 
 
-- showTree :: Show t => Tree t -> String 
-- showTree tree = unlines (showTree' tree) 
 
-- showTree' :: Show t => Tree t -> [String] 
-- showTree' Empty = ["_"] 
-- showTree' (Node a l r)

--   | isTreeEmpty l && isTreeEmpty r = [show a] 
--   | otherwise = show a : zipWith (\l r -> l ++ " " ++ r) 
--                       (showTree' l) 
--                       (showTree' r) 
 
-- main :: IO () 
-- main = do 
--   totalList <- readLn :: IO Int 
--   list <-  getListFromInput totalList 
 
--   let p = makeTree list 
--   let emptyTree = isTreeEmpty p 
 
--   if not emptyTree  
--     then do 
 
--       n <- readLn :: IO Int 
--       putStrLn $ "n = " ++ show n 
 
--       -- memanggil fungsi showTree(p) 
--       putStrLn "tree p : " 
--       putStrLn $ showTree p 
 
--       -- memanggil fungsi akar(p) 
--       putStrLn $ "akar(p) = " ++ show (akar p :: Int) 
 
--       -- memanggil fungsi left(p) 
--       putStrLn "left(p) =" 
--       putStrLn $ showTree (left p) 
 
--       -- memanggil fungsi right(p) 
--       putStrLn "right(p) =" 
--       putStrLn $ showTree (right p) 
 
--       -- memanggil fungsi nbElmt(p) 
--       putStrLn $ "nbElmt(p) = " ++ show (nbElmt p) 
 
--       -- memanggil fungsi nbDaun(p) 
--       putStrLn $ "nbDaun(p) = " ++ show (nbDaun p) 
 
--       -- memanggil fungsi nbEven(p) 
--       putStrLn $ "nbEven(p) = " ++ show (nbEven p) 
 
--       -- memanggil fungsi nbOdd(p) 
--       putStrLn $ "nbOdd(p) = " ++ show (nbOdd p)

--       -- memanggil fungsi isTreeEmpty(p) 
--       putStrLn $ "isTreeEmpty(p) = " ++ show (isTreeEmpty p) 
 
--       -- memanggil fungsi isOneElemt(p) 
--       putStrLn $ "isOneElemt(p) = " ++ show (isOneElemt p) 
 
--       -- memanggil fungsi isUnerLeft(p) 
--       putStrLn $ "isUnerLeft(p) = " ++ show (isUnerLeft p) 
 
--       -- memanggil fungsi isUnerRight(p) 
--       putStrLn $ "isUnerRight(p) = " ++ show (isUnerRight p) 
 
--       -- memanggil fungsi isBiner(p) 
--       putStrLn $ "isBiner(p) = " ++ show (isBiner p) 
 
--       -- memanggil fungsi isExitLeft(p) 
--       putStrLn $ "isExitLeft(p) = " ++ show (isExitLeft p) 
 
--       -- memanggil fungsi isExitRight(p) 
--       putStrLn $ "isExitRight(p) = " ++ show (isExitRight p) 
 
--       -- memanggil fungsi isExistN(p, n) 
--       putStrLn $ "isExistN(p, n) = " ++ show (isExistN p n) 
 
--       -- memanggil fungsi isBalance(p) 
--       putStrLn $ "isBalance(p) = " ++ show (isBalance p) 
 
--     else putStrLn "Ini pohon kosong!"-- NAMA  : WESLY FERY WANDA AMBARITA
-- -- NIM   : 11S23013
-- -- PRODI : INFORMATIKA
-- -- KELAS : 11IF1

-- -- Definisi Pohon Biner 
-- data Tree t = Empty | Node t (Tree t) (Tree t) deriving (Show)

-- makeTree :: [Int] -> Tree Int 
-- -- TODO: realisasi Haskell disini
-- makeTree [] = Empty
-- makeTree (x:xs) = Node x (makeTree leftTail) (makeTree rightTail) 
--                 where
--                   panjang = length xs
--                   mid = panjang  `div` 2
--                   (leftTail, rightTail) = splitAt (if panjang `mod` 2 == 0 then mid else mid + 1)(xs)

-- akar :: Tree t -> t
-- akar (Node a _ _) = a

-- left :: Tree t -> Tree t
-- left (Node _ l _) = l

-- right :: Tree t -> Tree t
-- right (Node _ _ r) = r

-- -- Operator -- > nbElmt(p), memberikan banyaknya elemen dari pohon p. 
-- nbElmt :: Tree t -> Int 
-- nbElmt Empty = 0
-- nbElmt (Node _ l r) = 1 +  nbElmt l + nbElmt r

-- -- > nbDaun(p), memberikan banyaknya daun dari pohon p. 
-- nbDaun :: Tree t -> Int -- TODO: realisasi Haskell disini 
-- nbDaun Empty = 0
-- nbDaun (Node _ Empty Empty) = 1 -- Node tanpa anak merupakan daun
-- nbDaun (Node _ l r) = nbDaun l + nbDaun r

-- nbEven :: Integral t => Tree t -> Int
-- nbEven Empty = 0
-- nbEven (Node a l r) = if a `mod` 2 == 0
--                       then 1 + nbEven l + nbEven r
--                         else nbEven l + nbEven r

-- nbOdd :: Integral t => Tree t -> Int
-- nbOdd Empty = 0
-- nbOdd (Node a l r) = if a `mod` 2 /= 0
--                       then 1 + nbOdd l + nbOdd r
--                         else nbOdd l + nbOdd r

-- -- > isTreeEmpty(p), adalah benar jika p kosong: (//  \\). 
-- isTreeEmpty :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isTreeEmpty (Node _ _ _) = False
-- isTreeEmpty Empty = True

-- isOneElemt :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isOneElemt (Node a Empty Empty) = True
-- isOneElemt (Node a l Empty) = False
-- isOneElemt (Node a Empty r) = False
-- isOneElemt (Node a l r) = False

-- -- > isUnerLeft(p) adalah benar jika p hanya mengandung sub pohon kiri tidak kosong: (// a l \\). 
-- isUnerLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isUnerLeft p = if nbElmt p == 2 then True
--                   else False

-- -- isUnerLeft Empty = False
-- -- isUnerLeft (Node a l r) = False
-- -- isUnerLeft (Node a Empty r) = False
-- -- isUnerLeft (Node a l Empty) && nbElmt l == 2 = True

-- -- > isUnerRight(p) adalah benar jika p hanya mengandung sub pohon kanan tidak kosong: (// a r \\). 
-- isUnerRight :: Tree t -> Bool 
-- isUnerRight Empty = False
-- isUnerRight (Node a l r) = False
-- isUnerRight (Node a Empty r) = True
-- isUnerRight (Node a l Empty) = False

-- -- isUnerRight :: Tree t -> Bool 
-- -- isUnerRight p = False

-- -- > isBiner(p) adalah benar jika p mengandung sub pohon kiri dan sub pohon kanan: (// a l r \\). 
-- isBiner :: Tree t -> Bool 
-- isBiner Empty = False
-- isBiner (Node a l Empty) = isBiner l
-- isBiner (Node a Empty r) = isBiner r
-- isBiner (Node a l r) = True

-- -- > isExitLeft(p) adalah benar jika p mengandung sub pohon kiri. 
-- isExitLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isExitLeft Empty = False
-- isExitLeft (Node _ Empty _ ) = False
-- isExitLeft (Node _ l _ ) = True

-- -- > isExitRight(p) adalah benar jika p mengandung sub pohon kiri. 
-- isExitRight :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isExitRight Empty = False
-- isExitRight (Node _ _ Empty) = False
-- isExitRight (Node _ r _ ) = True

-- -- > isExistN(p, n) adalah benar jika p mengandung bilangan n. 
-- isExistN :: Tree Int -> Int -> Bool -- TODO: realisasi Haskell disini 
-- isExistN p n = if nbElmt p == 1 then n == akar p
--                 else if nbElmt p == 2 then n == akar p || isExistN (left p) n 
--                 else if nbElmt p > 3 then n == akar p || isExistN (right p) n || isExistN (left p) n
--                 else False 

-- -- > isBalance(p) adalah benar jika p mengandung sub pohon kiri dan kanan dengan jumlah yang sama banyak. 
-- isBalance :: Tree Int -> Bool 
-- isBalance (Node a l r) = nbElmt l == nbElmt r

-- -- Fungsi lainnya 
-- getListFromInput :: Int -> IO [Int] 
-- getListFromInput 0 = return [] 
-- getListFromInput n = do 
--   x <- readLn :: IO Int 
--   xs <- getListFromInput (n - 1) 
--   return (x : xs) 
 
-- showTree :: Show t => Tree t -> String 
-- showTree tree = unlines (showTree' tree) 
 
-- showTree' :: Show t => Tree t -> [String] 
-- showTree' Empty = ["_"] 
-- showTree' (Node a l r)

--   | isTreeEmpty l && isTreeEmpty r = [show a] 
--   | otherwise = show a : zipWith (\l r -> l ++ " " ++ r) 
--                       (showTree' l) 
--                       (showTree' r) 
 
-- main :: IO () 
-- main = do 
--   totalList <- readLn :: IO Int 
--   list <-  getListFromInput totalList 
 
--   let p = makeTree list 
--   let emptyTree = isTreeEmpty p 
 
--   if not emptyTree  
--     then do 
 
--       n <- readLn :: IO Int 
--       putStrLn $ "n = " ++ show n 
 
--       -- memanggil fungsi showTree(p) 
--       putStrLn "tree p : " 
--       putStrLn $ showTree p 
 
--       -- memanggil fungsi akar(p) 
--       putStrLn $ "akar(p) = " ++ show (akar p :: Int) 
 
--       -- memanggil fungsi left(p) 
--       putStrLn "left(p) =" 
--       putStrLn $ showTree (left p) 
 
--       -- memanggil fungsi right(p) 
--       putStrLn "right(p) =" 
--       putStrLn $ showTree (right p) 
 
--       -- memanggil fungsi nbElmt(p) 
--       putStrLn $ "nbElmt(p) = " ++ show (nbElmt p) 
 
--       -- memanggil fungsi nbDaun(p) 
--       putStrLn $ "nbDaun(p) = " ++ show (nbDaun p) 
 
--       -- memanggil fungsi nbEven(p) 
--       putStrLn $ "nbEven(p) = " ++ show (nbEven p) 
 
--       -- memanggil fungsi nbOdd(p) 
--       putStrLn $ "nbOdd(p) = " ++ show (nbOdd p)

--       -- memanggil fungsi isTreeEmpty(p) 
--       putStrLn $ "isTreeEmpty(p) = " ++ show (isTreeEmpty p) 
 
--       -- memanggil fungsi isOneElemt(p) 
--       putStrLn $ "isOneElemt(p) = " ++ show (isOneElemt p) 
 
--       -- memanggil fungsi isUnerLeft(p) 
--       putStrLn $ "isUnerLeft(p) = " ++ show (isUnerLeft p) 
 
--       -- memanggil fungsi isUnerRight(p) 
--       putStrLn $ "isUnerRight(p) = " ++ show (isUnerRight p) 
 
--       -- memanggil fungsi isBiner(p) 
--       putStrLn $ "isBiner(p) = " ++ show (isBiner p) 
 
--       -- memanggil fungsi isExitLeft(p) 
--       putStrLn $ "isExitLeft(p) = " ++ show (isExitLeft p) 
 
--       -- memanggil fungsi isExitRight(p) 
--       putStrLn $ "isExitRight(p) = " ++ show (isExitRight p) 
 
--       -- memanggil fungsi isExistN(p, n) 
--       putStrLn $ "isExistN(p, n) = " ++ show (isExistN p n) 
 
--       -- memanggil fungsi isBalance(p) 
--       putStrLn $ "isBalance(p) = " ++ show (isBalance p) 
 
--     else putStrLn "Ini pohon kosong!"-- NAMA  : WESLY FERY WANDA AMBARITA
-- -- NIM   : 11S23013
-- -- PRODI : INFORMATIKA
-- -- KELAS : 11IF1

-- -- Definisi Pohon Biner 
-- data Tree t = Empty | Node t (Tree t) (Tree t) deriving (Show)

-- makeTree :: [Int] -> Tree Int 
-- -- TODO: realisasi Haskell disini
-- makeTree [] = Empty
-- makeTree (x:xs) = Node x (makeTree leftTail) (makeTree rightTail) 
--                 where
--                   panjang = length xs
--                   mid = panjang  `div` 2
--                   (leftTail, rightTail) = splitAt (if panjang `mod` 2 == 0 then mid else mid + 1)(xs)

-- akar :: Tree t -> t
-- akar (Node a _ _) = a

-- left :: Tree t -> Tree t
-- left (Node _ l _) = l

-- right :: Tree t -> Tree t
-- right (Node _ _ r) = r

-- -- Operator -- > nbElmt(p), memberikan banyaknya elemen dari pohon p. 
-- nbElmt :: Tree t -> Int 
-- nbElmt Empty = 0
-- nbElmt (Node _ l r) = 1 +  nbElmt l + nbElmt r

-- -- > nbDaun(p), memberikan banyaknya daun dari pohon p. 
-- nbDaun :: Tree t -> Int -- TODO: realisasi Haskell disini 
-- nbDaun Empty = 0
-- nbDaun (Node _ Empty Empty) = 1 -- Node tanpa anak merupakan daun
-- nbDaun (Node _ l r) = nbDaun l + nbDaun r

-- nbEven :: Integral t => Tree t -> Int
-- nbEven Empty = 0
-- nbEven (Node a l r) = if a `mod` 2 == 0
--                       then 1 + nbEven l + nbEven r
--                         else nbEven l + nbEven r

-- nbOdd :: Integral t => Tree t -> Int
-- nbOdd Empty = 0
-- nbOdd (Node a l r) = if a `mod` 2 /= 0
--                       then 1 + nbOdd l + nbOdd r
--                         else nbOdd l + nbOdd r

-- -- > isTreeEmpty(p), adalah benar jika p kosong: (//  \\). 
-- isTreeEmpty :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isTreeEmpty (Node _ _ _) = False
-- isTreeEmpty Empty = True

-- isOneElemt :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isOneElemt (Node a Empty Empty) = True
-- isOneElemt (Node a l Empty) = False
-- isOneElemt (Node a Empty r) = False
-- isOneElemt (Node a l r) = False

-- -- > isUnerLeft(p) adalah benar jika p hanya mengandung sub pohon kiri tidak kosong: (// a l \\). 
-- isUnerLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isUnerLeft p = if nbElmt p == 2 then True
--                   else False

-- -- isUnerLeft Empty = False
-- -- isUnerLeft (Node a l r) = False
-- -- isUnerLeft (Node a Empty r) = False
-- -- isUnerLeft (Node a l Empty) && nbElmt l == 2 = True

-- -- > isUnerRight(p) adalah benar jika p hanya mengandung sub pohon kanan tidak kosong: (// a r \\). 
-- isUnerRight :: Tree t -> Bool 
-- isUnerRight Empty = False
-- isUnerRight (Node a l r) = False
-- isUnerRight (Node a Empty r) = True
-- isUnerRight (Node a l Empty) = False

-- -- isUnerRight :: Tree t -> Bool 
-- -- isUnerRight p = False

-- -- > isBiner(p) adalah benar jika p mengandung sub pohon kiri dan sub pohon kanan: (// a l r \\). 
-- isBiner :: Tree t -> Bool 
-- isBiner Empty = False
-- isBiner (Node a l Empty) = isBiner l
-- isBiner (Node a Empty r) = isBiner r
-- isBiner (Node a l r) = True

-- -- > isExitLeft(p) adalah benar jika p mengandung sub pohon kiri. 
-- isExitLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isExitLeft Empty = False
-- isExitLeft (Node _ Empty _ ) = False
-- isExitLeft (Node _ l _ ) = True

-- -- > isExitRight(p) adalah benar jika p mengandung sub pohon kiri. 
-- isExitRight :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isExitRight Empty = False
-- isExitRight (Node _ _ Empty) = False
-- isExitRight (Node _ r _ ) = True

-- -- > isExistN(p, n) adalah benar jika p mengandung bilangan n. 
-- isExistN :: Tree Int -> Int -> Bool -- TODO: realisasi Haskell disini 
-- isExistN p n = if nbElmt p == 1 then n == akar p
--                 else if nbElmt p == 2 then n == akar p || isExistN (left p) n 
--                 else if nbElmt p > 3 then n == akar p || isExistN (right p) n || isExistN (left p) n
--                 else False 

-- -- > isBalance(p) adalah benar jika p mengandung sub pohon kiri dan kanan dengan jumlah yang sama banyak. 
-- isBalance :: Tree Int -> Bool 
-- isBalance (Node a l r) = nbElmt l == nbElmt r

-- -- Fungsi lainnya 
-- getListFromInput :: Int -> IO [Int] 
-- getListFromInput 0 = return [] 
-- getListFromInput n = do 
--   x <- readLn :: IO Int 
--   xs <- getListFromInput (n - 1) 
--   return (x : xs) 
 
-- showTree :: Show t => Tree t -> String 
-- showTree tree = unlines (showTree' tree) 
 
-- showTree' :: Show t => Tree t -> [String] 
-- showTree' Empty = ["_"] 
-- showTree' (Node a l r)

--   | isTreeEmpty l && isTreeEmpty r = [show a] 
--   | otherwise = show a : zipWith (\l r -> l ++ " " ++ r) 
--                       (showTree' l) 
--                       (showTree' r) 
 
-- main :: IO () 
-- main = do 
--   totalList <- readLn :: IO Int 
--   list <-  getListFromInput totalList 
 
--   let p = makeTree list 
--   let emptyTree = isTreeEmpty p 
 
--   if not emptyTree  
--     then do 
 
--       n <- readLn :: IO Int 
--       putStrLn $ "n = " ++ show n 
 
--       -- memanggil fungsi showTree(p) 
--       putStrLn "tree p : " 
--       putStrLn $ showTree p 
 
--       -- memanggil fungsi akar(p) 
--       putStrLn $ "akar(p) = " ++ show (akar p :: Int) 
 
--       -- memanggil fungsi left(p) 
--       putStrLn "left(p) =" 
--       putStrLn $ showTree (left p) 
 
--       -- memanggil fungsi right(p) 
--       putStrLn "right(p) =" 
--       putStrLn $ showTree (right p) 
 
--       -- memanggil fungsi nbElmt(p) 
--       putStrLn $ "nbElmt(p) = " ++ show (nbElmt p) 
 
--       -- memanggil fungsi nbDaun(p) 
--       putStrLn $ "nbDaun(p) = " ++ show (nbDaun p) 
 
--       -- memanggil fungsi nbEven(p) 
--       putStrLn $ "nbEven(p) = " ++ show (nbEven p) 
 
--       -- memanggil fungsi nbOdd(p) 
--       putStrLn $ "nbOdd(p) = " ++ show (nbOdd p)

--       -- memanggil fungsi isTreeEmpty(p) 
--       putStrLn $ "isTreeEmpty(p) = " ++ show (isTreeEmpty p) 
 
--       -- memanggil fungsi isOneElemt(p) 
--       putStrLn $ "isOneElemt(p) = " ++ show (isOneElemt p) 
 
--       -- memanggil fungsi isUnerLeft(p) 
--       putStrLn $ "isUnerLeft(p) = " ++ show (isUnerLeft p) 
 
--       -- memanggil fungsi isUnerRight(p) 
--       putStrLn $ "isUnerRight(p) = " ++ show (isUnerRight p) 
 
--       -- memanggil fungsi isBiner(p) 
--       putStrLn $ "isBiner(p) = " ++ show (isBiner p) 
 
--       -- memanggil fungsi isExitLeft(p) 
--       putStrLn $ "isExitLeft(p) = " ++ show (isExitLeft p) 
 
--       -- memanggil fungsi isExitRight(p) 
--       putStrLn $ "isExitRight(p) = " ++ show (isExitRight p) 
 
--       -- memanggil fungsi isExistN(p, n) 
--       putStrLn $ "isExistN(p, n) = " ++ show (isExistN p n) 
 
--       -- memanggil fungsi isBalance(p) 
--       putStrLn $ "isBalance(p) = " ++ show (isBalance p) 
 
--     else putStrLn "Ini pohon kosong!"-- NAMA  : WESLY FERY WANDA AMBARITA
-- -- NIM   : 11S23013
-- -- PRODI : INFORMATIKA
-- -- KELAS : 11IF1

-- -- Definisi Pohon Biner 
-- data Tree t = Empty | Node t (Tree t) (Tree t) deriving (Show)

-- makeTree :: [Int] -> Tree Int 
-- -- TODO: realisasi Haskell disini
-- makeTree [] = Empty
-- makeTree (x:xs) = Node x (makeTree leftTail) (makeTree rightTail) 
--                 where
--                   panjang = length xs
--                   mid = panjang  `div` 2
--                   (leftTail, rightTail) = splitAt (if panjang `mod` 2 == 0 then mid else mid + 1)(xs)

-- akar :: Tree t -> t
-- akar (Node a _ _) = a

-- left :: Tree t -> Tree t
-- left (Node _ l _) = l

-- right :: Tree t -> Tree t
-- right (Node _ _ r) = r

-- -- Operator -- > nbElmt(p), memberikan banyaknya elemen dari pohon p. 
-- nbElmt :: Tree t -> Int 
-- nbElmt Empty = 0
-- nbElmt (Node _ l r) = 1 +  nbElmt l + nbElmt r

-- -- > nbDaun(p), memberikan banyaknya daun dari pohon p. 
-- nbDaun :: Tree t -> Int -- TODO: realisasi Haskell disini 
-- nbDaun Empty = 0
-- nbDaun (Node _ Empty Empty) = 1 -- Node tanpa anak merupakan daun
-- nbDaun (Node _ l r) = nbDaun l + nbDaun r

-- nbEven :: Integral t => Tree t -> Int
-- nbEven Empty = 0
-- nbEven (Node a l r) = if a `mod` 2 == 0
--                       then 1 + nbEven l + nbEven r
--                         else nbEven l + nbEven r

-- nbOdd :: Integral t => Tree t -> Int
-- nbOdd Empty = 0
-- nbOdd (Node a l r) = if a `mod` 2 /= 0
--                       then 1 + nbOdd l + nbOdd r
--                         else nbOdd l + nbOdd r

-- -- > isTreeEmpty(p), adalah benar jika p kosong: (//  \\). 
-- isTreeEmpty :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isTreeEmpty (Node _ _ _) = False
-- isTreeEmpty Empty = True

-- isOneElemt :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isOneElemt (Node a Empty Empty) = True
-- isOneElemt (Node a l Empty) = False
-- isOneElemt (Node a Empty r) = False
-- isOneElemt (Node a l r) = False

-- -- > isUnerLeft(p) adalah benar jika p hanya mengandung sub pohon kiri tidak kosong: (// a l \\). 
-- isUnerLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isUnerLeft p = if nbElmt p == 2 then True
--                   else False

-- -- isUnerLeft Empty = False
-- -- isUnerLeft (Node a l r) = False
-- -- isUnerLeft (Node a Empty r) = False
-- -- isUnerLeft (Node a l Empty) && nbElmt l == 2 = True

-- -- > isUnerRight(p) adalah benar jika p hanya mengandung sub pohon kanan tidak kosong: (// a r \\). 
-- isUnerRight :: Tree t -> Bool 
-- isUnerRight Empty = False
-- isUnerRight (Node a l r) = False
-- isUnerRight (Node a Empty r) = True
-- isUnerRight (Node a l Empty) = False

-- -- isUnerRight :: Tree t -> Bool 
-- -- isUnerRight p = False

-- -- > isBiner(p) adalah benar jika p mengandung sub pohon kiri dan sub pohon kanan: (// a l r \\). 
-- isBiner :: Tree t -> Bool 
-- isBiner Empty = False
-- isBiner (Node a l Empty) = isBiner l
-- isBiner (Node a Empty r) = isBiner r
-- isBiner (Node a l r) = True

-- -- > isExitLeft(p) adalah benar jika p mengandung sub pohon kiri. 
-- isExitLeft :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isExitLeft Empty = False
-- isExitLeft (Node _ Empty _ ) = False
-- isExitLeft (Node _ l _ ) = True

-- -- > isExitRight(p) adalah benar jika p mengandung sub pohon kiri. 
-- isExitRight :: Tree t -> Bool -- TODO: realisasi Haskell disini 
-- isExitRight Empty = False
-- isExitRight (Node _ _ Empty) = False
-- isExitRight (Node _ r _ ) = True

-- -- > isExistN(p, n) adalah benar jika p mengandung bilangan n. 
-- isExistN :: Tree Int -> Int -> Bool -- TODO: realisasi Haskell disini 
-- isExistN p n = if nbElmt p == 1 then n == akar p
--                 else if nbElmt p == 2 then n == akar p || isExistN (left p) n 
--                 else if nbElmt p > 3 then n == akar p || isExistN (right p) n || isExistN (left p) n
--                 else False 

-- -- > isBalance(p) adalah benar jika p mengandung sub pohon kiri dan kanan dengan jumlah yang sama banyak. 
-- isBalance :: Tree Int -> Bool 
-- isBalance (Node a l r) = nbElmt l == nbElmt r

-- -- Fungsi lainnya 
-- getListFromInput :: Int -> IO [Int] 
-- getListFromInput 0 = return [] 
-- getListFromInput n = do 
--   x <- readLn :: IO Int 
--   xs <- getListFromInput (n - 1) 
--   return (x : xs) 
 
-- showTree :: Show t => Tree t -> String 
-- showTree tree = unlines (showTree' tree) 
 
-- showTree' :: Show t => Tree t -> [String] 
-- showTree' Empty = ["_"] 
-- showTree' (Node a l r)

--   | isTreeEmpty l && isTreeEmpty r = [show a] 
--   | otherwise = show a : zipWith (\l r -> l ++ " " ++ r) 
--                       (showTree' l) 
--                       (showTree' r) 
 
-- main :: IO () 
-- main = do 
--   totalList <- readLn :: IO Int 
--   list <-  getListFromInput totalList 
 
--   let p = makeTree list 
--   let emptyTree = isTreeEmpty p 
 
--   if not emptyTree  
--     then do 
 
--       n <- readLn :: IO Int 
--       putStrLn $ "n = " ++ show n 
 
--       -- memanggil fungsi showTree(p) 
--       putStrLn "tree p : " 
--       putStrLn $ showTree p 
 
--       -- memanggil fungsi akar(p) 
--       putStrLn $ "akar(p) = " ++ show (akar p :: Int) 
 
--       -- memanggil fungsi left(p) 
--       putStrLn "left(p) =" 
--       putStrLn $ showTree (left p) 
 
--       -- memanggil fungsi right(p) 
--       putStrLn "right(p) =" 
--       putStrLn $ showTree (right p) 
 
--       -- memanggil fungsi nbElmt(p) 
--       putStrLn $ "nbElmt(p) = " ++ show (nbElmt p) 
 
--       -- memanggil fungsi nbDaun(p) 
--       putStrLn $ "nbDaun(p) = " ++ show (nbDaun p) 
 
--       -- memanggil fungsi nbEven(p) 
--       putStrLn $ "nbEven(p) = " ++ show (nbEven p) 
 
--       -- memanggil fungsi nbOdd(p) 
--       putStrLn $ "nbOdd(p) = " ++ show (nbOdd p)

--       -- memanggil fungsi isTreeEmpty(p) 
--       putStrLn $ "isTreeEmpty(p) = " ++ show (isTreeEmpty p) 
 
--       -- memanggil fungsi isOneElemt(p) 
--       putStrLn $ "isOneElemt(p) = " ++ show (isOneElemt p) 
 
--       -- memanggil fungsi isUnerLeft(p) 
--       putStrLn $ "isUnerLeft(p) = " ++ show (isUnerLeft p) 
 
--       -- memanggil fungsi isUnerRight(p) 
--       putStrLn $ "isUnerRight(p) = " ++ show (isUnerRight p) 
 
--       -- memanggil fungsi isBiner(p) 
--       putStrLn $ "isBiner(p) = " ++ show (isBiner p) 
 
--       -- memanggil fungsi isExitLeft(p) 
--       putStrLn $ "isExitLeft(p) = " ++ show (isExitLeft p) 
 
--       -- memanggil fungsi isExitRight(p) 
--       putStrLn $ "isExitRight(p) = " ++ show (isExitRight p) 
 
--       -- memanggil fungsi isExistN(p, n) 
--       putStrLn $ "isExistN(p, n) = " ++ show (isExistN p n) 
 
--       -- memanggil fungsi isBalance(p) 
--       putStrLn $ "isBalance(p) = " ++ show (isBalance p) 
 
--     else putStrLn "Ini pohon kosong!"