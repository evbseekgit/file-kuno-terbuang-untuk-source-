-- Vektor sebagai list
type Vector = [Double]

-- Operasi dasar vektor
addVectors :: Vector -> Vector -> Vector
addVectors v1 v2 = zipWith (+) v1 v2

subtractVectors :: Vector -> Vector -> Vector
subtractVectors v1 v2 = zipWith (-) v1 v2

dotProduct :: Vector -> Vector -> Double
dotProduct v1 v2 = sum $ zipWith (*) v1 v2

scaleVector :: Double -> Vector -> Vector
scaleVector scalar v = map (* scalar) v

magnitude :: Vector -> Double
magnitude v = sqrt $ dotProduct v v

normalize :: Vector -> Vector
normalize v = scaleVector (1 / magnitude v) v

-- Contoh penggunaan
main :: IO ()
main = do
    let v1 = [1.0, 2.0, 3.0]
    let v2 = [4.0, 5.0, 6.0]
    
    putStrLn "Vektor 1: " >> print v1
    putStrLn "Vektor 2: " >> print v2
    putStrLn "Penjumlahan: " >> print (addVectors v1 v2)
    putStrLn "Dot product: " >> print (dotProduct v1 v2)
    putStrLn "Magnitude v1: " >> print (magnitude v1)
    putStrLn "Vektor ternormalisasi: " >> print (normalize v1)