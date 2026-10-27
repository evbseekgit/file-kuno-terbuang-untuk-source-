--DEFINISI TYPE
data Vector3 = Vector3 { x :: Double , y :: Double , z :: Double } deriving Show 

--SELEKTOR
getX :: Vector3 -> Double
getX a = x a

getY :: Vector3 -> Double
getY a = y a

getZ :: Vector3 -> Double
getZ a = z a

--KONSTRUKTOR
makeVector3 :: Double -> Double -> Double -> Vector3
makeVector3 a b c = Vector3 { x = a , y = b , z = c }

--PREDIKAT
isOrigin :: Vector3 -> Bool
isOrigin a = x a == 0 && y a == 0 && z a == 0

isRight :: Vector3 -> Bool
isRight a = x a == 1 && y a == 0 && z a == 0

isUp :: Vector3 -> Bool
isUp a = x a == 0 && y a == 1 && z a == 0

isForward :: Vector3 -> Bool
isForward a = x a == 0 && y a == 0 && z a == 1

isOne :: Vector3 -> Bool
isOne a = x a == 1 && y a == 1 && z a == 1

isLeft :: Vector3 -> Bool
isLeft a = x a == (-1) && y a == 0 && z a == 0

isDown :: Vector3 -> Bool
isDown a = x a == 0 && y a == (-1) && z a == 0

isBack :: Vector3 -> Bool
isBack a = x a == 0 && y a == 0 && z a == (-1)

isEquals :: Vector3 -> Vector3 -> Bool
isEquals a b =  x a == x b && y a == y b && z a == z b

isNotEquals :: Vector3 -> Vector3 -> Bool
isNotEquals a b = if isEquals a b == True then False
                    else True

vectorMax :: Vector3 -> Vector3 -> Vector3
vectorMax a b = Vector3 {x = if x a >= x b then x a
                                else x b,
                         y = if y a >= y b then y a
                                else y b,
                         z = if z a >= z b then z a
                                else z b}

vectorMin :: Vector3 -> Vector3 -> Vector3
vectorMin a b = Vector3 {x = if x a <= x b then x a
                                else x b,
                         y = if y a <= y b then y a
                                else y b,
                         z = if z a <= z b then z a
                                else z b}

magnitude :: Vector3 -> Double
magnitude a = sqrt ((x a)*(x a) + (y a)*(y a) + (z a)*(z a))

normalized :: Vector3 -> Vector3
normalized a = Vector3 { x = roundToTwoDecimalPlaces((x a)/magnitude a) , y = roundToTwoDecimalPlaces((y a)/magnitude a) , z = roundToTwoDecimalPlaces((z a)/magnitude a)}

dotProduct :: Vector3 -> Vector3 -> Double
dotProduct a b = (x a) * (x b) + (y a) * (y b) + (z a) * (z b)

crossProduct :: Vector3 -> Vector3 -> Vector3
crossProduct a b = Vector3 { x = ((y a) * (z b)) - ((z a) * (y b)),
                             y = ((z a) * (x b)) - ((x a) * (z b)),
                             z = ((x a) * (y b)) - ((y a) * (x b))}

angle :: Vector3 -> Vector3 -> Double
angle a b = roundToOneDecimalPlaces ((angleRadian a b) * (180.0 / phi))
    where phi = roundToTwoDecimalPlaces (22.0 / 7.0)

radToAngle ::Vector3 -> Vector3 -> Double
radToAngle a b = (angle a b) * 180 / (22/7)

angleRadian :: Vector3 -> Vector3 -> Double
angleRadian v w =
    let a = dotProduct v w
        b = magnitude v * magnitude w
        c = roundToTwoDecimalPlaces (a / b)
    in 
        roundToTwoDecimalPlaces (acos c)

angleDegree :: Vector3 -> Vector3 -> Double
angleDegree v w = roundToOneDecimalPlaces ((angleRadian v w) * (180.0 / phi))
    where phi = roundToTwoDecimalPlaces (22.0 / 7.0)

distance :: Vector3 -> Vector3 -> Double
distance a b = sqrt ((getX b - getX a) ^ 2 + (getY b - getY a) ^ 2 + (getZ b - getZ a) ^ 2)
  -- sqrt ((b x - a x)*(b x - a x) + (b y - a y)*(b y - a y) + (b z - a z)*(b z - a z) )

scale :: Vector3 -> Double -> Vector3
scale a n = Vector3 { x = x a * n , y = y a * n , z = z a * n }

addVector :: Vector3 -> Vector3 -> Vector3
addVector a b = Vector3 { x = (x a + x b) ,y = (y a + y b) , z = (z a + z b)}

subVector :: Vector3 -> Vector3 -> Vector3
subVector a b = Vector3 { x = (x a - x b) ,y = (y a - y b) , z = (z a - z b)}

mulVector :: Vector3 -> Vector3 -> Vector3
mulVector a b = Vector3 { x = (x a)*(x b) ,y = (y a)*(y b) , z = (z a)*(z b)}

divVector :: Vector3 -> Vector3 -> Vector3
divVector a b = Vector3 { x = roundToOneDecimalPlaces((x a)/(x b)) ,y = roundToOneDecimalPlaces((y a)/(y b)) , z = roundToOneDecimalPlaces((z a)/(z b))}
-- divVector a b = Vector3 {x = if x a /= 0 && x b == 0 then Infinity
--                               else if x a == 0 && x b == 0 then NaN
--                                 else (x a)/(x b),
--                          y = if y a /= 0 && y b == 0 then Infinity
--                                 else (x a)/(x b),       }

reflect :: Vector3 -> Vector3 -> Vector3 
reflect v w =
    let a = 2.0 * dotProduct v w
        b = scale w a
    in 
        subVector v b


lerp :: Vector3 -> Vector3 -> Double -> Vector3
lerp v w t =
    let a = subVector w v 
        b = scale a t
    in 
        addVector v b


roundToTwoDecimalPlaces :: Double -> Double
roundToTwoDecimalPlaces x = fromIntegral (round $ x * 100) / 100

roundToOneDecimalPlaces :: Double -> Double
roundToOneDecimalPlaces x = fromIntegral (round $ x * 10.0) / 10.0


main :: IO ()
main = do 
  x1 <- readLn :: IO Double
  y1 <- readLn :: IO Double
  z1 <- readLn :: IO Double
  x2 <- readLn :: IO Double
  y2 <- readLn :: IO Double
  z2 <- readLn :: IO Double
  n <- readLn :: IO Double

  let v1 = makeVector3 x1 y1 z1
      v2 = makeVector3 x2 y2 z2

  putStrLn $ "v = " ++ show v1
  putStrLn $ "w = " ++ show v2 
  putStrLn $ "t = " ++ show n 

  putStrLn $ "isOrigin(v) = " ++ show (isOrigin v1) 
  putStrLn $ "isOrigin(w) = " ++ show (isOrigin v2) 

  putStrLn $ "isRight(v) = " ++ show (isRight v1) 
  putStrLn $ "isRight(w) = " ++ show (isRight v2)

  putStrLn $ "isUp(v) = " ++ show (isUp v1) 
  putStrLn $ "isUp(w) = " ++ show (isUp v2)

  putStrLn $ "isForward(v) = " ++ show (isForward v1) 
  putStrLn $ "isForward(w) = " ++ show (isForward v2)

  putStrLn $ "isOne(v) = " ++ show (isOne v1) 
  putStrLn $ "isOne(w) = " ++ show (isOne v2)

  putStrLn $ "isLeft(v) = " ++ show (isLeft v1) 
  putStrLn $ "isLeft(w) = " ++ show (isLeft v2)

  putStrLn $ "isDown(v) = " ++ show (isDown v1) 
  putStrLn $ "isDown(w) = " ++ show (isDown v2)

  putStrLn $ "isBack(v) = " ++ show (isBack v1) 
  putStrLn $ "isBack(w) = " ++ show (isBack v2)

  putStrLn $ "isEquals(v, w) = " ++ show (isEquals v1 v2) 

  putStrLn $ "isNotEquals(v, w) = " ++ show (isNotEquals v1 v2)

  putStrLn $ "vectorMax(v, w) = " ++ show (vectorMax v1 v2)

  putStrLn $ "vectorMin(v, w) = " ++ show (vectorMin v1 v2)

  putStrLn $ "magnitude(v) = " ++ show (roundToTwoDecimalPlaces(magnitude v1))
  putStrLn $ "magnitude(w) = " ++ show (roundToTwoDecimalPlaces(magnitude v2))

  putStrLn $ "normalized(v) = " ++ show (normalized v1)
  putStrLn $ "normalized(w) = " ++ show (normalized v2)

  putStrLn $ "dotProduct(v, w) = " ++ show (dotProduct v1 v2)
  putStrLn $ "crossProduct(v, w) = " ++ show (crossProduct v1 v2)

  putStrLn $ "angle(v, w) [radian] = " ++ show (roundToTwoDecimalPlaces(angleRadian v1 v2))
  putStrLn $ "angle(v, w) [degree] = " ++ show (angleDegree v1 v2)

  putStrLn $ "distance(v, w) = " ++ show (roundToTwoDecimalPlaces(distance v1 v2))

  putStrLn $ "scale(v, t) = " ++ show (scale v1 n)

  putStrLn $ "addVector(v, w) = " ++ show (addVector v1 v2)

  putStrLn $ "subVector(v, w) = " ++ show (subVector v1 v2)

  putStrLn $ "mulVector(v, w) = " ++ show (mulVector v1 v2)

  putStrLn $ "divVector(v, w) = " ++ show (divVector v1 v2) 

  putStrLn $ "reflect(v, w) = " ++ show (reflect v1 v2)

  putStrLn $ "lerp(v, w, t) = " ++ show (lerp v1 v2 n)


  
  






  

