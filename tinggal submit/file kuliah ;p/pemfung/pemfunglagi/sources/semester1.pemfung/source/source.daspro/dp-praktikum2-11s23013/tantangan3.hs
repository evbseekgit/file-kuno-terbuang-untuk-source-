--Nama = Wesly Ambarita
--NIM  = 11S23013
--Kelas= 11IF1
--Prodi= Informatika

grade :: Double -> String
grade x =
-- grade(x) adalah fungsi yang berfungsi untuk menentukan grade yang diperoleh oleh seorang mahasiswa untuk nilai ujian x (bilangan real) dengan cara melakukan input nilai ujian x (bilangan real)
    if x >= 80
        then "A"
    else if x < 80 && x >= 72
        then "AB"
    else if x < 72 && x >= 65
        then "B"
    else if x < 65 && x >= 57
        then "BC"
    else if x < 57 && x >= 50
        then "C"
    else if x < 50 && x >= 35
        then "D"
        else "E"    

main :: IO()
main = do
    x <- readLn :: IO Double
--memanggil fungsi grade
    print (grade x)