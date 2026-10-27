-- Definisi tipe data vektor
data Vector = Vector { x :: Double, y :: Double, z :: Double }
    deriving (Show, Eq)

-- Operasi vektor 3D
add :: Vector -> Vector -> Vector
add (Vector x1 y1 z1) (Vector x2 y2 z2) = Vector (x1 + x2) (y1 + y2) (z1 + z2)

subtract :: Vector -> Vector -> Vector
subtract (Vector x1 y1 z1) (Vector x2 y2 z2) = Vector (x1 - x2) (y1 - y2) (z1 - z2)

dot :: Vector -> Vector -> Double
dot (Vector x1 y1 z1) (Vector x2 y2 z2) = x1*x2 + y1*y2 + z1*z2

cross :: Vector -> Vector -> Vector
cross (Vector x1 y1 z1) (Vector x2 y2 z2) = 
    Vector (y1*z2 - z1*y2) (z1*x2 - x1*z2) (x1*y2 - y1*x2)

scale :: Double -> Vector -> Vector
scale s (Vector x y z) = Vector (s*x) (s*y) (s*z)

magnitude3D :: Vector -> Double
magnitude3D v = sqrt (dot v v)

normalize3D :: Vector -> Vector
normalize3D v = scale (1 / magnitude3D v) v

-- Contoh penggunaan
main :: IO ()
main = do
    let v1 = Vector 1 2 3
    let v2 = Vector 4 5 6
    
    putStrLn "Vektor 1: " >> print v1
    putStrLn "Vektor 2: " >> print v2
    putStrLn "Penjumlahan: " >> print (add v1 v2)
    putStrLn "Dot product: " >> print (dot v1 v2)
    putStrLn "Cross product: " >> print (cross v1 v2)
    putStrLn "Magnitude: " >> print (magnitude3D v1)