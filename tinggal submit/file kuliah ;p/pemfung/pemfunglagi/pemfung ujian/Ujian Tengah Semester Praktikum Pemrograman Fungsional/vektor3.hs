data Vector3 = Vector3{ x :: Double, y :: Double, z :: Double }
  deriving (Show, Eq)


makeVektor :: Double -> Double -> Double -> Vector3
makeVektor a b c = Vector3 a b c

isOrigin :: Vector3 -> Bool
isOrigin (Vector3 a b c) = a == 0 && b == 0 && c == 0

isRight :: Vector3 -> Bool
isRight (Vector3 a _ _) = a > 0

isLeft :: Vector3 -> Bool
isLeft (Vector3 a _ _) = a < 0

isUp :: Vector3 -> Bool
isUp (Vector3 _ b _) = b > 0

isDown :: Vector3 -> Bool
isDown (Vector3 _ b _) = b < 0

isForward :: Vector3 -> Bool
isForward (Vector3 _ _ c) = c > 0

isBack :: Vector3 -> Bool
isBack (Vector3 _ _ c) = c < 0

isOne :: Vector3 -> Bool
isOne (Vector3 a b c) = a == 1 && b == 1 && c == 0

isEquals :: Vector3 -> Vector3 -> Bool
isEquals v1 v2 = v1 == v2

isNotEquals :: Vector3 -> Vector3 -> Bool
isNotEquals v1 v2 = v1 /= v2

vectorMax :: Vector3 -> Vector3 -> Vector3
vectorMax (Vector3 a b c) (Vector3 d e f) = 
  Vector3 (max a d) (max b e) (max c f)

vectorMin :: Vector3 -> Vector3 -> Vector3
vectorMin (Vector3 a b c) (Vector3 d e f) =
  Vector3 (min a d) (min b e) (min c f)

--penjumlahan 2 vektor
addVector :: Vector3 -> Vector3 -> Vector3
addVector (Vector3 a b c) (Vector3 d e f) = 
  Vector3 (a + d) (b + e) (c + f)

--pengurangan 2 vektor
subVector :: Vector3 -> Vector3 -> Vector3
subVector (Vector3 a b c) (Vector3 d e f) =
  Vector3 (a - d) (b - e) (c - f)

--perkalian 2 vektor
mulVector :: Vector3 -> Vector3 -> Vector3
mulVector (Vector3 a b c) (Vector3 d e f) =
  Vector3 (a * d) (b * e) (c * f)

divVector :: Vector3 -> Vector3 -> Vector3
divVector (Vector3 a b c) (Vector3 d e f) =
  Vector3 (a / d) (b / e) (c / f)

scale :: Vector3 -> Double -> Vector3
scale (Vector3 a b c) t =
  Vector3 (a*t) (b*t) (c*t)

magnitude :: Vector3 -> Double
magnitude (Vector3 a b c) = sqrt (Vector3 a b c)

normalized :: Vector3 -> Vector3
normalized v (Vector3 a b c)
  | mag == 0  = Vector3 0 0 0
  | otherwise = Vector3 (a / mag) (b / mag) (c / mag)
  where mag = scale (1 / magnitude (Vector3 a b c))

dotProduct :: Vector3 -> Vector3 -> Double
dotProduct (Vector3 a b c) (Vector3 d e f) = 
  a*d + b*e + c*f

crossproduct :: Vector3 -> Vector3 -> Double
crossproduct (Vector3 a b c) (Vector3 d e f) =
  Vector3 (b*f - c*e) (c*d - a*f) (a*e - b*d)

main :: IO ()
main = do
  let v = makeVector 1 0 0
  let w = makeVector 0 1 0
  let t = 1.0
putStrLn ("v = " ++ show v)
putStrLn ("w = " ++ show w)
putStrLn ("t = " ++ show t)
putStrLn ("\nisOrigin (v) = " ++ show (isOrigin v))
putStrLn ("isorigin (w) = " ++ show (isOrigin w))
