--NAMA : WESLY AMBARITA
--NIM : 11S23013
--PRODI : INFORMATIKIA

data Pecahan = Pecahan { a :: Int, b :: Int } deriving Show -- Realisasi Selektor 

pemb :: Pecahan -> Int -- TODO: realisasi Haskell disini 
pemb (Pecahan x _) = x

peny :: Pecahan -> Int -- TODO: realisasi Haskell disini 
peny (Pecahan _ y) = y

makeP :: Int -> Int -> Pecahan -- TODO: realisasi Haskell disini 
makeP x y = Pecahan {a = x, b = y}

addP :: Pecahan -> Pecahan -> Pecahan -- TODO: realisasi Haskell disini
addP e f = Pecahan {a = ((pemb e * peny f) + (pemb f * peny e)), b = (peny e * peny f)}

subP :: Pecahan -> Pecahan -> Pecahan -- TODO: realisasi Haskell disini 
subP e f = Pecahan {a = ((pemb e * peny f) - (pemb f * peny e)), b = (peny e * peny f)}

mulP :: Pecahan -> Pecahan -> Pecahan -- TODO: realisasi Haskell disini
mulP e f = Pecahan {a = (pemb e * pemb f), b = (peny e * peny f)}

divP :: Pecahan -> Pecahan -> Pecahan -- TODO: realisasi Haskell disini 
divP e f = Pecahan {a = (pemb e * peny f),b = (peny e * pemb f)}

isEqP :: Pecahan -> Pecahan -> Bool -- TODO: realisasi Haskell disini 
isEqP e f = (pemb e *  peny f) == (pemb f *  peny e)

isLtP :: Pecahan -> Pecahan -> Bool -- TODO: realisasi Haskell disini 
isLtP e f = (pemb e * peny f) < (pemb f * peny e)
 
main :: IO () 
main = do 
  pemb1 <- readLn :: IO Int 
  peny1 <- readLn :: IO Int 
  pemb2 <- readLn :: IO Int 
  peny2 <- readLn :: IO Int 
 
  -- membuat point 
  let p1 = makeP pemb1 peny1 
      p2 = makeP pemb2 peny2 
   
  putStrLn $ "p1 = " ++ show p1 
  putStrLn $ "p2 = " ++ show p2 
 
  -- memanggil fungsi addP(p1, p2) 
  putStrLn $ "addP(p1, p2) = " ++ show (addP p1 p2)

  -- memanggil fungsi subP(p1, p2) 
  putStrLn $ "subP(p1, p2) = " ++ show (subP p1 p2) 
 
  -- memanggil fungsi mulP(p1, p2) 
  putStrLn $ "mulP(p1, p2) = " ++ show (mulP p1 p2) 
 
  -- memanggil fungsi divP(p1, p2) 
  putStrLn $ "divP(p1, p2) = " ++ show (divP p1 p2) 
 
  -- memanggil fungsi isEqP(p1, p2) 
  putStrLn $ "isEqP(p1, p2) = " ++ show (isEqP p1 p2) 
 
  -- memanggil fungsi isLtP(p1, p2) 
  putStrLn $ "isLtP(p1, p2) = " ++ show (isLtP p1 p2) 














































 
  --WESLY
   --WESLY
    --WESLY
     --WESLY
      --WESLY
       --WESLY
        --WESLY
         --WESLY
          --WESLY
           --WESLY
            --WESLY
             --WESLY
              --WESLY
               --WESLY
                --WESLY
                 --WESLY
                  --WESLY
                   --WESLY
                   