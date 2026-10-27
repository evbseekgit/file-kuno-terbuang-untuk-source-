konso e l = e : l

konsb l e = balikList (konso e (balikList l))

prtmElmt (x:_) = x
prtmElmt [] = error "List kosong"

scndList [] = []
scndList (_:xs) = xs

trkhrElmt [] = error "List kosong"
trkhrElmt [x] = x
trkhrElmt (_:xs) = trkhrElmt xs

kplList [] = []
kplList l = balikList (scndList (balikList l))

tnghList [] = []          
tnghList [x] = [x]          
tnghList l =                
  let panjang = hitungPanjang l  
      tengah = panjang `div` 2    
  in [x | (i, x) <- zip [0..] l, genap panjang && i >= tengah - 1 && i <= tengah || ganjil panjang && i == tengah]

hitungPanjang [] = 0
hitungPanjang (_:xs) = 1 + hitungPanjang xs

nbElmt [] = 0
nbElmt (_:xs) = 1 + nbElmt xs

konkat [] l2 = l2
konkat (x:xs) l2 = x : konkat xs l2

balikList [] = []
balikList (x:xs) = balikList xs `konkat` [x]

maxList [x] = x
maxList (x:xs) = if x > maxList xs then x else maxList xs

elmtKeN (x:_) 1 = x
elmtKeN (_:xs) n = elmtKeN xs (n - 1)
elmtKeN _ _ = error "Posisi tidak valid"

sumList [] = 0
sumList (x:xs) = x + sumList xs

averageList [] = error "List kosong"
averageList l = let s = sumList l
                    len = nbElmt l
                in fromIntegral s / fromIntegral len

isEmpty [] = True
isEmpty _ = False

isOneElmt l = nbElmt l == 1

isEqual l1 l2 = l1 == l2

isMember [] _ = False
isMember (x:xs) y = x == y || isMember xs y

isFirst [] _ = False
isFirst (x:_) y = x == y

islast [] _ = False
islast [x] y = x == y
islast (_:xs) y = islast xs y

isNbElemt l1 l2 = nbElmt l1 == nbElmt l2

isReverse l1 l2 = l1 == balikList l2

isXElmtKeN l x n = n >= 1 && n <= nbElmt l && elmtKeN l n == x

genap n = n `mod` 2 == 0
ganjil n = n `mod` 2 == 1

getListFromInput 0 = return []
getListFromInput n = do
  x <- readLn :: IO Int
  xs <- getListFromInput (n - 1)
  return (x:xs)
  
main :: IO ()
main = do
  totalCure1 <- readLn :: IO Int
  lol1 <- getListFromInput totalCure1

  totalCure2 <- readLn :: IO Int
  lol2 <- getListFromInput totalCure2

  ate1  <- readLn :: IO Int
  nerd1 <- readLn :: IO Int
  nerd2 <- readLn :: IO Int
  eks1 <- readLn :: IO Int
  eks2 <- readLn :: IO Int

  let lol1konso = konso ate1 lol1
      lol1konsb = konsb lol1 ate1
      lol2konso = konso ate1 lol2
      lol2konsb = konsb lol2 ate1

  putStrLn $ "e = " ++ show ate1
  putStrLn $ "l1 = " ++ show lol1
  putStrLn $ "l1 (konso) = " ++ show lol1konso
  putStrLn $ "l1 (konsb) = " ++ show lol1konsb
  putStrLn $ "l2 = " ++ show lol2
  putStrLn $ "l2 (konso) = " ++ show lol2konso
  putStrLn $ "l2 (konsb) = " ++ show lol2konsb
  putStrLn $ "n1 = " ++ show nerd1
  putStrLn $ "n2 = " ++ show nerd2
  putStrLn $ "x1 = " ++ show eks1
  putStrLn $ "x2 = " ++ show eks2
  putStrLn $ "firstElmt(l1) = " ++ show (prtmElmt lol1)
  putStrLn $ "firstElmt(l2) = " ++ show (prtmElmt lol2)
  putStrLn $ "tailList(l1) = " ++ show (scndList lol1)
  putStrLn $ "tailList(l2) = " ++ show (scndList lol2)
  putStrLn $ "lastElmt(l1) = " ++ show (trkhrElmt lol1)
  putStrLn $ "lastElmt(l2) = " ++ show (trkhrElmt lol2)
  putStrLn $ "headList(l1) = " ++ show (kplList lol1)
  putStrLn $ "headList(l2) = " ++ show (kplList lol2)
  putStrLn $ "midList(l1) = " ++ show (tnghList lol1)
  putStrLn $ "midList(l2) = " ++ show (tnghList lol2)
  putStrLn $ "nbElmt(l1) = " ++ show (nbElmt lol1)
  putStrLn $ "nbElmt(l2) = " ++ show (nbElmt lol2)
  putStrLn $ "konkat(l1, l2) = " ++ show (konkat lol1 lol2)
  putStrLn $ "maxList(l1) = " ++ show (maxList lol1)
  putStrLn $ "maxList(l2) = " ++ show (maxList lol2)
  putStrLn $ "elmtKeN(l1, n1) = " ++ show (elmtKeN lol1 nerd1)
  putStrLn $ "elmtKeN(l2, n2) = " ++ show (elmtKeN lol2 nerd2)
  putStrLn $ "sumList(l1) = " ++ show (sumList lol1)
  putStrLn $ "sumList(l2) = " ++ show (sumList lol2)
  putStrLn $ "averageList(l1) = " ++ show (averageList lol1)
  putStrLn $ "averageList(l2) = " ++ show (averageList lol2)
  putStrLn $ "isEqual(l1, l2) = " ++ show (isEqual lol1 lol2)
  putStrLn $ "isEqual(l1, l2) = " ++ show (isEqual lol1 lol2)
  putStrLn $ "isMember(l1, x1) = " ++ show (isMember lol1 eks1)
  putStrLn $ "isMember(l2, x2) = " ++ show (isMember lol2 eks2)
  putStrLn $ "isFirst(l1, x1) = " ++ show (isFirst lol1 eks1)
  putStrLn $ "isFirst(l2, x2) = " ++ show (isFirst lol2 eks2)
  putStrLn $ "islast(l1, x1) = " ++ show (islast lol1 eks1)
  putStrLn $ "islast(l2, x2) = " ++ show (islast lol2 eks2)
  putStrLn $ "isNbElemt(l1, l2) = " ++ show (isNbElemt lol1 lol2)
  putStrLn $ "isReverse(l1, l2) = " ++ show (isReverse lol1 lol2)
  putStrLn $ "isXElmtKeN(l1, x1, n1) = " ++ show (isXElmtKeN lol1 eks1 nerd1)
  putStrLn $ "isXElmtKeN(l2, x2, n2) = " ++ show (isXElmtKeN lol2 eks2 nerd2)