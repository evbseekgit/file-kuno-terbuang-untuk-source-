-- Realisasi Konstruktor -- > konso(e, l), menghasilkan sebuah list dari l dan e, dengan e sebagai elemen terakhir. 
konso :: Int -> [Int] -> [Int] 
konso e l = e : l -- > konsb(l, e), menghasilkan sebuah list dari l dan e, dengan e sebagai elemen terkair list. 

konsb :: [Int] -> Int -> [Int] 
konsb l e = reverseList (konso e (reverseList l)) 

 -- Realisasi Selektor -- > firstElmt(l), mengembalikan elemen pertama list l. 
firstElmt :: [Int] -> Int 
firstElmt l = head l

 -- > tailList(l), mengembalikan list tanpa elemen pertama list l. 
tailList :: [Int] -> [Int] 
tailList [] = [] 
tailList (_:l) = l 

-- > lastElmt(l), mengembalikan elemen terakhir list l. 
lastElmt :: [Int] -> Int 
lastElmt l = firstElmt (reverseList l) 

-- > headList(l), mengembalikan list tanpa elemen terakhir list l. 
headList :: [Int] -> [Int] 
headList l = reverseList (tailList (reverseList l))

-- > midList(l), menghasilkan list untuk elemen yang berada di tengah list l. 
midList :: [Int] -> [Int] 
midList l 
          | nbElmt l == 0 = []
          | nbElmt l == 1 = l
          | nbElmt l == 2 = l
          | nbElmt l `mod` 2 == 0 = midList ( tailList ( reverseList l ))
          | nbElmt l `mod` 2 /= 0 = midList ( tailList ( reverseList l ))

-- TODO: realisasi Haskell disini 
 -- Realisasi Operator -- > nbElmt(l), menghitung jumlah elemen list, nol jika kosong. 
nbElmt :: [Int] -> Int 
nbElmt [] = 0 
nbElmt (_:list) = 1 + nbElmt list 

-- > konkat(l1, l2), menghasilkan konkatenasi 2 buah list, dengan list l2 sesudah list l1. 
konkat :: [Int] -> [Int] -> [Int] 
konkat [] l2 = l2 
konkat (x:l1) l2 = x : konkat l1 l2 

-- > reverseList(l), memberikan list yang urutan elemennya adalah kebalikan dari list asal. 
reverseList :: [Int] -> [Int] 
reverseList l = reverse l 

-- > maxList(l), menghasilkan nilai elemen list yang mempunyai nilai terbesar. Minimal list terdiri atas 1 elemen. 
maxList :: [Int ] -> Int 
maxList l 
          | nbElmt l == 1 = firstElmt l 
          | nbElmt l > 1 && firstElmt l > firstElmt (tailList l) = maxList (konso (firstElmt l) (tailList (tailList l)))
          | nbElmt l > 1 && firstElmt l < firstElmt (tailList l) = maxList (tailList l )
-- TODO: realisasi Haskell disini 
 -- > elmtKeN(l, n) untuk mengembalikan nilai elemen pada posisi n di list l. Ukuran list harus lebih besar atau sama dengan n. 
elmtKeN :: [Int] -> Int -> Int -- TODO: realisasi Haskell disini 
elmtKeN l n  
          | n == 1 = firstElmt l  
          | otherwise = elmtKeN (tailList l) (n-1)

 -- > sumList(l), menghasilkan total nilai dari elemen yang terdapat pada list l. 
sumList :: [Int] -> Int -- TODO: realisasi Haskell disini
sumList l = if nbElmt l == 0 then 0
                else firstElmt l + sumList (tailList l)

 -- > averageList(l), menghasilkan nilai rata-rata dari elemen yang terdapat pada list l. 
averageList :: [Int] -> Double -- TODO: realisasi Haskell disini 
averageList l = fromIntegral (sumList l) / fromIntegral (nbElmt l)

 -- Realisasi Predikat -- > isEmpty(l), adalah benar jika list kosong. 
isEmpty :: [Int] -> Bool 
isEmpty l = null l -- > isOneElemt(l), adalah benar jika list berisi satu elemen. 

isOneElemt :: [Int] -> Bool 
isOneElemt l = nbElmt l == 1 -- > isEqual(l1, l2) adalah benar jika list l1 sama dengan list l2. 

isEqual :: [Int] -> [Int] -> Bool -- TODO: realisasi Haskell disini
isEqual l m = nbElmt l == nbElmt m && firstElmt l == firstElmt m && isEqual (tailList l) (tailList m) -- Rekursif: Periksa sisa list

-- > isMember(l, x) adalah benar jika x adalah elemen list l. 
isMember :: [Int] -> Int -> Bool -- TODO: realisasi Haskell disini
isMember l x = x == firstElmt l || isMember (tailList l) (x)

 -- > isFirst(l, x) adalah benar jika x adalah elemen pertama pada list l. 
isFirst :: [Int] -> Int -> Bool 
isFirst l x = x == firstElmt l

 -- > islast(l, x) adalah benar jika x adalah elemen terakhir pada list l. 
islast :: [Int] -> Int -> Bool -- TODO: realisasi Haskell disini 
islast l x = lastElmt l == x 

 -- > isNbElemt(l1, l2) adalah benar jika jumlah elemen list l1 sama dengan jumlah elemen list l2. 
isNbElemt :: [Int] -> [Int] -> Bool -- TODO: realisasi Haskell disini 
isNbElemt l m = nbElmt l == nbElmt m

 -- > isReverse(l1, l2) adalah benar jika list l2 adalah reverse dari list l1. 
isReverse :: [Int] -> [Int] -> Bool -- TODO: realisasi Haskell disini 
isReverse l m = m == reverseList l 

 -- > isXElmtKeN(l, x, n) adalah benar jika elemen x berada pada list l dan tepat berada di posisi n. 
isXElmtKeN :: [Int] -> Int -> Int -> Bool -- TODO: realisasi Haskell disini 
isXElmtKeN l x n = x == elmtKeN l n

 -- Fungsi lainnya 
getListFromInput :: Int -> IO [Int] 
getListFromInput 0 = return [] 
getListFromInput n = do 
  x <- readLn :: IO Int 
  xs <- getListFromInput (n - 1) 
  return (x : xs) 
 
main :: IO () 
main = do 
  totalList1 <- readLn :: IO Int 
  l1 <-  getListFromInput totalList1 
  
  totalList2 <- readLn :: IO Int 
  l2 <-  getListFromInput totalList2 
  
  e <- readLn :: IO Int 
  n1 <- readLn :: IO Int 
  n2 <- readLn :: IO Int 
  x1 <- readLn :: IO Int 
  x2 <- readLn :: IO Int 

  -- menggunakan konso dan konsb 
  let l1konso = konso e l1 
      l1konsb = konsb l1 e 
  let l2konso = konso e l2 
      l2konsb = konsb l2 e 
    
  putStrLn $ "e = " ++ show e 
  putStrLn $ "l1 = " ++ show l1 
  putStrLn $ "l1 (konso) = " ++ show l1konso 
  putStrLn $ "l1 (konsb) = " ++ show l1konsb 
  putStrLn $ "l2 = " ++ show l2 
  putStrLn $ "l2 (konso) = " ++ show l2konso 
  putStrLn $ "l2 (konsb) = " ++ show l2konsb 
  putStrLn $ "n1 = " ++ show n1 
  putStrLn $ "n2 = " ++ show n2 
  putStrLn $ "x1 = " ++ show x1 
  putStrLn $ "x2 = " ++ show x2 
  
  -- memanggil fungsi firstElmt(l) 
  putStrLn $ "firstElmt(l1) = " ++ show (firstElmt l1) 
  putStrLn $ "firstElmt(l2) = " ++ show (firstElmt l2) 
  
    -- memanggil fungsi tailList(l) 
  putStrLn $ "tailList(l1) = " ++ show (tailList l1) 
  putStrLn $ "tailList(l2) = " ++ show (tailList l2) 
  
    -- memanggil fungsi lastElmt(l) 
  putStrLn $ "lastElmt(l1) = " ++ show (lastElmt l1) 
  putStrLn $ "lastElmt(l2) = " ++ show (lastElmt l2) 
  
    -- memanggil fungsi headList(l) 
  putStrLn $ "headList(l1) = " ++ show (headList l1) 
  putStrLn $ "headList(l2) = " ++ show (headList l2) 
  
    -- memanggil fungsi midList(l) 
  putStrLn $ "midList(l1) = " ++ show (midList l1) 
  putStrLn $ "midList(l2) = " ++ show (midList l2) 
  
    -- memanggil fungsi nbElmt(l) 
  putStrLn $ "nbElmt(l1) = " ++ show (nbElmt l1) 
  putStrLn $ "nbElmt(l2) = " ++ show (nbElmt l2) 
  
    -- memanggil fungsi konkat(l1, l2) 
  putStrLn $ "konkat(l1, l2) = " ++ show (konkat l1 l2) 
  
    -- memanggil fungsi maxList(l) 
  putStrLn $ "maxList(l1) = " ++ show (maxList l1) 
  putStrLn $ "maxList(l2) = " ++ show (maxList l2)

    -- memanggil fungsi elmtKeN(l, n) 
  putStrLn $ "elmtKeN(l1, n1) = " ++ show (elmtKeN l1 n1) 
  putStrLn $ "elmtKeN(l2, n2) = " ++ show (elmtKeN l2 n2) 
  
    -- memanggil fungsi sumList(l) 
  putStrLn $ "sumList(l1) = " ++ show (sumList l1) 
  putStrLn $ "sumList(l2) = " ++ show (sumList l2) 
  
    -- memanggil fungsi averageList(l) 
  putStrLn $ "averageList(l1) = " ++ show (averageList l1) 
  putStrLn $ "averageList(l2) = " ++ show (averageList l2) 
  
    -- memanggil fungsi isEqual(l1, l2) 
  putStrLn $ "isEqual(l1, l2) = " ++ show (isEqual l1 l2) 
  
    -- memanggil fungsi isEqual(l1, l2) 
  putStrLn $ "isEqual(l1, l2) = " ++ show (isEqual l1 l2) 
  
    -- memanggil fungsi isMember(l, x) 
  putStrLn $ "isMember(l1, x1) = " ++ show (isMember l1 x1) 
  putStrLn $ "isMember(l2, x2) = " ++ show (isMember l2 x2) 
  
    -- memanggil fungsi isFirst(l, x) 
  putStrLn $ "isFirst(l1, x1) = " ++ show (isFirst l1 x1) 
  putStrLn $ "isFirst(l2, x2) = " ++ show (isFirst l2 x2) 
  
    -- memanggil fungsi islast(l, x) 
  putStrLn $ "islast(l1, x1) = " ++ show (islast l1 x1) 
  putStrLn $ "islast(l2, x2) = " ++ show (islast l2 x2) 
  
    -- memanggil fungsi isNbElemt(l1, l2) 
  putStrLn $ "isNbElemt(l1, l2) = " ++ show (isNbElemt l1 l2) 
  
    -- memanggil fungsi isReverse(l1, l2) 
  putStrLn $ "isReverse(l1, l2) = " ++ show (isReverse l1 l2) 
  
    -- isXElmtKeN(l, x, n) 
  putStrLn $ "isXElmtKeN(l1, x1, n1) = " ++ show (isXElmtKeN l1 x1 n1) 
  putStrLn $ "isXElmtKeN(l2, x2, n2) = " ++ show (isXElmtKeN l2 x2 n2)