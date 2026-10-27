{-# LANGUAGE FlexibleInstances #-}

class VectorSpace v where
    addVec :: v -> v -> v
    scaleVec :: Double -> v -> v
    dotVec :: v -> v -> Double
    magnitudeVec :: v -> Double
    magnitudeVec v = sqrt (dotVec v v)
    normalizeVec :: v -> v
    normalizeVec v = scaleVec (1 / magnitudeVec v) v

-- Instance untuk list
instance VectorSpace [Double] where
    addVec = zipWith (+)
    scaleVec s = map (* s)
    dotVec v1 v2 = sum $ zipWith (*) v1 v2

-- Instance untuk tipe data Vector 3D
instance VectorSpace Vector where
    addVec = add
    scaleVec = scale
    dotVec = dot

-- Fungsi utilitas untuk vektor dinamis
vectorDistance :: VectorSpace v => v -> v -> Double
vectorDistance v1 v2 = magnitudeVec (addVec v1 (scaleVec (-1) v2))

-- Contoh penggunaan polimorfik
demoVectorSpace :: IO ()
demoVectorSpace = do
    let listVec1 = [1.0, 2.0, 3.0] :: [Double]
    let listVec2 = [4.0, 5.0, 6.0] :: [Double]
    
    let vec3D1 = Vector 1 2 3
    let vec3D2 = Vector 4 5 6
    
    putStrLn "=== List Vectors ==="
    putStrLn "Distance: " >> print (vectorDistance listVec1 listVec2)
    
    putStrLn "=== 3D Vectors ==="
    putStrLn "Distance: " >> print (vectorDistance vec3D1 vec3D2)

main :: IO ()
main = demoVectorSpace