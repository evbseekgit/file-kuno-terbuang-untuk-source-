-- wujudZatAir(x) melakukan pengecekan wujud zat dari air, berdasarkan suhu air x, dengan x (bilangan real) yang merupakan masukan ke fungsi
wujudZatAir :: Double -> String
-- TODO: realisasi Haskell disini
wujudZatAir x = if x < 0
                    then PADAT
                else if x >= 0 && x < 100
                    then CAIR
                    else GAS

main :: IO ()
main = do
    x <- readLn :: IO Double
-- memanggil fungsi wujudZatAir
    print (wujudZatAir x)