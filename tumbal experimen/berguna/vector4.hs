type Matrix = [Vector]

-- Operasi matriks-vektor
matrixVectorMultiply :: Matrix -> Vector -> Vector -> Vector
matrixVectorMultiply mat vec = map (`dot` vec) mat

-- Membuat matriks identitas 3x3
identityMatrix :: Matrix
identityMatrix = [Vector 1 0 0, Vector 0 1 0, Vector 0 0 1]

-- Rotasi matriks
rotationX :: Double -> Matrix
rotationX angle = 
    [ Vector 1 0 0
    , Vector 0 (cos angle) (-sin angle)
    , Vector 0 (sin angle) (cos angle)
    ]

demoMatrix :: IO ()
demoMatrix = do
    let vec = Vector 1 2 3
    let rotMat = rotationX (pi/4)  -- rotasi 45 derajat
    
    putStrLn "Vektor asli: " >> print vec
    putStrLn "Setelah rotasi X: " >> print (matrixVectorMultiply rotMat vec)

main :: IO ()
main = demoMatrix