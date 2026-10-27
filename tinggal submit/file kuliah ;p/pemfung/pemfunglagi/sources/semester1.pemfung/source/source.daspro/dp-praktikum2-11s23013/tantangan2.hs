--Nama = Wesly Ambarita
--NIM  = 11S23013
--Kelas= 11IF1
--Prodi= Informatika

-- wujudZatAir(x) yang merupakan fungsi untuk memeriksa wujud zat dari pada air, berdasarkan suhu air x yang mana x (bilangan real) yang merupakan input terhadap fungsi
-- wujudZatAir(x) adalah fungsi untuk melakukan pengecekan wujud zat dari air, berdasarkan suhu air x, dengan x (bilangan real) yang merupakan masukan ke fungsi. Jika suhu di bawah 0 oC maka fungsi mengembalikan teks PADAT, jika suhu lebih besar atau sama dengan 0oC namun lebih kecil dari 100oC maka fungsi mengembalikan teks CAIR, jika suhu lebih besar atau sama dengan 100oC maka fungsi mengembalikan teks GAS. 
wujudZatAir :: Double -> String
wujudZatAir x =
    if x >= 0 && x < 100
        then "CAIR"
    else if  x >=100
        then "GAS"
        else "PADAT"
-- merealisasikan haskell
main :: IO()
main = do

    x <- readLn :: IO Double
-- memanggil fungsi wujudZatAir
    print (wujudZatAir x)